//
//  FirstViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LREmergencyViewController.h"
#import "LRLocationCoordinator.h"
#import "LRAnimations.h"
#import "LREmergencyViewCell.h"
@interface LREmergencyViewController ()
@property (strong, nonatomic) CLLocationManager *location;
@property (strong, nonatomic) LRAnimations *animator;
@property (strong, nonatomic) NSMutableArray *meds;
@end

@implementation LREmergencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.meds = [PFUser currentUser][@"meds"];
    self.buttonTable.dataSource = self;
    self.buttonTable.delegate = self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways){
        [self.location requestAlwaysAuthorization];
    }
    if(![PFUser currentUser]){
        [self.tabBarController performSegueWithIdentifier:@"login" sender:self];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CLLocationManager *)location{
    if(!_location){
        _location = [[CLLocationManager alloc] init];
    }
    return _location;
}
#pragma mark - UITableViewDataSource Protocal Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.meds.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.meds[indexPath.row] containsString:@"EpiPen"]){
        return [LREmergencyViewCell cellForCellType:LREmergencyViewCellTypeEpiPen];
    }
    else if([self.meds[indexPath.row] containsObject:@"Insulin"]){
        return [LREmergencyViewCell cellForCellType:LREmergencyViewCellTypeInsulin];
    }
    else{
        return [LREmergencyViewCell cellForCellType:LREmergencyViewCellTypeGeneral];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LREmergencyViewCell *cell = (LREmergencyViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell sendDistressSignal];
}
#pragma mark - Property Lazy Instantiation
-(LRAnimations *)animator{
    if(!_animator){
        _animator = [[LRAnimations alloc] init];
    }
    return _animator;
}
-(NSMutableArray *)meds{
    if(!_meds){
        _meds = [[NSMutableArray alloc] init];
    }
    return _meds;
}
@end
