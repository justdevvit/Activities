//
//  ActivitiesCountTableViewController.m
//  Activities
//
//  Created by Yoav Paskaro on 25/02/2022.
//

#import "ActivitiesCountTableViewController.h"
#import "ActivitiesListTableViewController.h"
#import "APIService.h"

@interface ActivitiesCountTableViewController ()

@property APIService *model;
@property NSMutableDictionary *activitiesCountDict;
@property NSArray *types;

@end

@implementation ActivitiesCountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [APIService new];
    self.activitiesCountDict = self.model.activitiesCountDict;
    self.navigationItem.title = @"Activities Count";
}

-(IBAction)addActivity:(id)sender {
    [self.model requestActivity:^{
        self.types = [self.activitiesCountDict allKeys];
        [self.tableView reloadData];
    }];
}

- (void)navigateToMyNewViewController:(NSInteger)index {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ActivitiesListTableViewController *activitiesListTableVC = (ActivitiesListTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ActivitiesList"];
    activitiesListTableVC.model = self.model;
    activitiesListTableVC.type =  self.types[index];
    [self.navigationController pushViewController:activitiesListTableVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
//     Configure the cell...
    NSString *type = self.types[indexPath.row];
    UILabel *labelName = (UILabel *)[cell viewWithTag:1];
    labelName.text = type;
    UILabel *labelCount = (UILabel *)[cell viewWithTag:2];
    labelCount.text = [[self.activitiesCountDict objectForKey:type] stringValue];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self navigateToMyNewViewController:indexPath.row];
}

@end
