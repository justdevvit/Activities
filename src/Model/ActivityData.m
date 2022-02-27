//
//  ActivityData.m
//  Activities
//
//  Created by Yoav Paskaro on 25/02/2022.
//

#import "ActivityData.h"

@implementation ActivityData

-(id) init {
    return [self initWithActivity:@"" andType:@"" andParticipants:0 andPrice:0.0 andLink:@"" andKey:@"" andAccessibility:0.0];
}

- (id)initWithProperties:(NSDictionary *)properties {
   if (self = [self init]) {
      [self setValuesForKeysWithDictionary:properties];
   }
   return self;
}

- (id)initWithActivity:(NSString*)activity andType:(NSString*)type
       andParticipants:(int)participants andPrice:(float)price andLink:(NSString*)link
       andKey:(NSString*)key andAccessibility:(float)accessibility
{
    self = [super init];
    if(self) {
        self.activity = activity;
        self.type = type;
        self.participants = participants;
        self.price = price;
        self.link = link;
        self.key = key;
        self.accessibility = accessibility;
    }
    return self;
}

@end
