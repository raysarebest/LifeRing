//
//  LRLocationCoordinator.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRLocationCoordinator.h"
@interface LRLocationCoordinator()
@property (strong, nonatomic) CLLocationManager *location;
@property (nonatomic, readwrite) BOOL beaconsEnabled;
@end
@implementation LRLocationCoordinator
#pragma mark - Public Methods
-(void)requestBeaconAccessWithViewController:(UIViewController *)controller{
    if(![CLLocationManager locationServicesEnabled]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Location Error" message:@"You have location services turned off in Settings. Please go to Settings > Privacy > Location Services and make sure Location Services is set to On" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert removeFromParentViewController];
        }];
        [alert addAction:ok];
        [controller presentViewController:alert animated:YES completion:nil];
    }
    else{
        if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
            [self.location requestAlwaysAuthorization];
        }
        else{
            NSLog(@"%d", [CLLocationManager authorizationStatus]);
        }
    }
}
#pragma mark - Property Lazy Instantiation
-(CLLocationManager *)location{
    if(!_location){
        _location = [[CLLocationManager alloc] init];
    }
    return _location;
}
#pragma mark - Initializers
-(instancetype)init{
    if(self = [super init]){
        if([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)){
            self.beaconsEnabled = YES;
        }
        else{
            self.beaconsEnabled = NO;
        }
        return self;
    }
    else{
        return nil;
    }
}
@end