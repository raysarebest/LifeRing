//
//  LRSignUpViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRSignUpViewController.h"
@import Parse;
@interface LRSignUpViewController()
@property (strong, nonatomic) NSArray *problems;
@end
@implementation LRSignUpViewController
-(IBAction)signUp{
    NSString *firstName = [self.firstNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].capitalizedString;
    NSString *lastName = [self.lastNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].capitalizedString;
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = self.passwordField.text;
    NSString *confirmPassword = self.confirmPasswordField.text;
    int age = [self.ageField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].intValue;

    if ([email length] == 0 || [password length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"You must enter your email address & password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(password != confirmPassword){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Password does not match" message:@"Please ensure that your passwords match." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    
    }
    else{
        PFUser *newUser = [PFUser user];
        newUser.email = email;
        newUser.password = password;
        newUser[@"firstName"] = firstName;
        newUser[@"lastName"] = firstName;
 

        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sorry!" message:@"Error." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alert addAction:ok];
                    [self presentViewController:alert animated:YES completion:nil];
            };
        }];
    }
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
