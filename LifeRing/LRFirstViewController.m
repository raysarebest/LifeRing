//
//  FirstViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRFirstViewController.h"
#import "LRLocationCoordinator.h"
@interface LRFirstViewController ()
@property (strong, nonatomic) CLLocationManager *location;
@end

@implementation LRFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways){
        [self.location requestAlwaysAuthorization];
    }
    if(![PFUser currentUser]){
        [self.tabBarController performSegueWithIdentifier:@"login" sender:self];
    }
    else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://8566697531"]];
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
@end
