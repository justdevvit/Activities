//
//  APIService.m
//  Activities
//
//  Created by Yoav Paskaro on 27/02/2022.
//

#import "APIService.h"
#import "ActivityData.h"
#import "AFNetworking.h"

@interface APIService ()

@property NSMutableArray *allActivitiesArray;

@end

@implementation APIService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.allActivitiesArray = [NSMutableArray new];
        self.activitiesCountDict = [NSMutableDictionary new];
    }
    return self;
}

-(void)requestActivity:(void (^)(void))completionHandler {
    NSOperationQueue *q = [NSOperationQueue new];
    [q addOperationWithBlock: ^{
        NSURL *URL = [NSURL URLWithString:@"http://www.boredapi.com/api/activity"];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:URL.absoluteString
          parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            @try {
                NSInteger count;
                ActivityData *item = [[ActivityData alloc]initWithProperties:responseObject];
                [self.allActivitiesArray addObject:item];
                NSString *key = item.type;
                id var = [self.activitiesCountDict objectForKey:key];
                count = var ? [var integerValue] : 0;
                count++;
                [self.activitiesCountDict setObject:@(count) forKey:key];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    completionHandler();
                }];
            }
            @catch(id anException) {
                NSLog(@"The response wasn't compitable to the contract");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
        }];
    }];
}

-(NSArray*)getDataByType:(NSString*)type {
    NSArray *filteredArray = [self.allActivitiesArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
        return [((ActivityData*)object).type isEqualToString:type];
    }]];
    
    NSArray *sortedArray = [filteredArray sortedArrayUsingFunction:SortActivitiesComparer context:nil];
    return sortedArray;
}

NSInteger SortActivitiesComparer(id id1, id id2, void *context)
{
    ActivityData* activityData1 = (ActivityData*)id1;
    ActivityData* activityData2 = (ActivityData*)id2;
    
    float v1 = activityData1.accessibility;
    float v2 = activityData2.accessibility;
    if (v1 < v2)
        return NSOrderedDescending;
    else if (v1 > v2)
        return NSOrderedAscending;
    else
        return NSOrderedSame;
}

@end
