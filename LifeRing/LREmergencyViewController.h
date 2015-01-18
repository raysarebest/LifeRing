//
//  FirstViewController.h
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//
#import "LREmergencyViewCell.h"
@import UIKit;
@import Parse;
@interface LREmergencyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *buttonTable;
@end