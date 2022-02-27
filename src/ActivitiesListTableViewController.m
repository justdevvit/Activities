//
//  ActivitiesListTableViewController.m
//  Activities
//
//  Created by Yoav Paskaro on 27/02/2022.
//

#import "ActivitiesListTableViewController.h"
#import "ActivityData.h"

@interface ActivitiesListTableViewController()

@property NSArray *data;

@end

@implementation ActivitiesListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat: @" %@ Activities list", self.type];
    self.data = [self.model getDataByType:self.type];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell" forIndexPath:indexPath];
    
//     Configure the cell...
    ActivityData *item = self.data[indexPath.row];
    UILabel *labelName = (UILabel *)[cell viewWithTag:1];
    labelName.text = item.activity;
    UILabel *labelCount = (UILabel *)[cell viewWithTag:2];
    labelCount.text = [@(item.accessibility) stringValue];
    
    return cell;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"ActivitiesListSectionHeader";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}

@end
