//
//  APIService.h
//  Activities
//
//  Created by Yoav Paskaro on 27/02/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIService : NSObject

@property NSMutableDictionary *activitiesCountDict;

-(void)requestActivity:(void (^)(void))completionHandler;
- (NSArray*)getDataByType:(NSString*)type;

@end

NS_ASSUME_NONNULL_END
