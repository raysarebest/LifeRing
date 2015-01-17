//
//  LRSignUpViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRSignUpViewController.h"
@interface LRSignUpViewController()
@property (strong, nonatomic) NSArray *miscDevices;
@property (strong, nonatomic) NSArray *inhalers;
@property (strong, nonatomic) NSMutableArray *checkedPaths;
-(NSArray *)userMedications;
@end
@implementation LRSignUpViewController
-(IBAction)signUp{
    
}
#pragma mark - UITableViewDataSource Protocol Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if([self.checkedPaths containsObject:indexPath]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if(indexPath.section == 0){
        cell.textLabel.text = self.miscDevices[indexPath.row];
    }
    else{
        cell.textLabel.text = self.inhalers[indexPath.row];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return self.miscDevices.count;
    }
    else{
        return self.inhalers.count;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *titles = @[@"Miscellaneous", @"Rescue Inhalers"];
    return titles[section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.checkedPaths removeObject:indexPath];
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.checkedPaths addObject:indexPath];
    }
}
#pragma mark - UITableViewDelegate Methods

#pragma mark - Property Lazy Instantiation
-(NSArray *)miscDevices{
    if(!_miscDevices){
        _miscDevices = @[@"Epinephirine (EpiPen)", @"Insulin"];
    }
    return _miscDevices;
}
-(NSArray *)inhalers{
    if(!_inhalers){
        _inhalers = @[@"Albuterol", @"Salbuterol", @"Bambuterol", @"Fenoterol", @"Isoetherine", @"Isoproterenol", @"Levalbuterol", @"Metaproterenol", @"Pirbuterol", @"Terbutaline", @"Tornalate"];
    }
    return _inhalers;
}
-(NSMutableArray *)checkedPaths{
    if(!_checkedPaths){
        _checkedPaths = [[NSMutableArray alloc] init];
    }
    return _checkedPaths;
}
#pragma mark - View Setup Code
-(void)viewDidLoad{
    self.problemsTableView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, self.problemsTableView.contentSize.height);
    self.problemsTableView.dataSource = self;
    self.problemsTableView.delegate = self;
}
#pragma mark - Private Helper Methods
-(NSArray *)userMedications{
    NSMutableArray *meds = [NSMutableArray array];
    for(NSIndexPath *index in self.checkedPaths){
        [meds addObject:[self.problemsTableView cellForRowAtIndexPath:index].textLabel.text];
    }
    return meds;
}
@end
