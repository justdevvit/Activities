//
//  ActivitiesListTableViewController.h
//  Activities
//
//  Created by Yoav Paskaro on 27/02/2022.
//

#import <UIKit/UIKit.h>
#import "APIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface ActivitiesListTableViewController : UITableViewController

@property NSString *type;
@property APIService *model;

@end

NS_ASSUME_NONNULL_END
