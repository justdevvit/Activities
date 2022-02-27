//
//  ActivityData.h
//  Activities
//
//  Created by Yoav Paskaro on 25/02/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActivityData : NSObject
@property NSString *activity;
@property NSString *type;
@property int participants;
@property float price;
@property NSString *link;
@property NSString *key;
@property float accessibility;

- (id)initWithProperties:(NSDictionary *)properties;

- (id)initWithActivity:(NSString*)activity andType:(NSString*)type
       andParticipants:(int)participants andPrice:(float)price
               andLink:(NSString*)link andKey:(NSString*)key
      andAccessibility:(float)accessibility;

@end

NS_ASSUME_NONNULL_END
