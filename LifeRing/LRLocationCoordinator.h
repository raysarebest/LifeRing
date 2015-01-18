//
//  LRLocationCoordinator.h
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//
@import Foundation;
@import CoreLocation;
@import UIKit;
@interface LRLocationCoordinator : NSObject
@property (nonatomic, readonly) BOOL beaconsEnabled;
-(void)requestBeaconAccessWithViewController:(UIViewController *)controller;
@end