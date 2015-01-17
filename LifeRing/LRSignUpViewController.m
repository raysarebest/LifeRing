//
//  LRSignUpViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRSignUpViewController.h"
@interface LRSignUpViewController()
@property (strong, nonatomic) NSArray *problems;
@end
@implementation LRSignUpViewController
-(IBAction)signUp{
    
}
#pragma mark - UITableViewDataSource Protocol Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld", (long)section);
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"Fuck you";
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark - Property Lazy Instantiation
-(NSArray *)problems{
    if(!_problems){
        _problems = @[@"Epinephirine (EpiPen)", @"Insulin", @"Albuterol", @"Salbuterol", @"Bambuterol", @"Fenoterol", @"Isoetherine", @"Isoproterenol", @"Levalbuterol", @"Metaproterenol", @"Pirbuterol", @"Terbutaline", @"Tornalate"];
    }
    return _problems;
}
#pragma mark - View Setup Code
-(void)viewDidLoad{
    self.problemsTableView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, self.problemsTableView.contentSize.height);
}
@end
