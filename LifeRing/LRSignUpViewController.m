//
//  LRSignUpViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRSignUpViewController.h"
#import "LRAnimations.h"
@import Parse;
@interface LRSignUpViewController()
@property (strong, nonatomic) NSArray *miscDevices;
@property (strong, nonatomic) NSArray *inhalers;
@property (strong, nonatomic) NSMutableArray *checkedPaths;
@property (strong, nonatomic) LRAnimations *animator;
-(NSArray *)userMedications;
@end
@implementation LRSignUpViewController
-(IBAction)signUp{
    NSString *firstName = [self.firstNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].capitalizedString;
    NSString *lastName = [self.lastNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].capitalizedString;
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = self.passwordField.text;
    NSString *confirmPassword = self.confirmPasswordField.text;
    NSNumber *age = [NSNumber numberWithInt:[self.ageField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].intValue];
    
    if (email.length == 0 || password.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"You must enter your email address & password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert removeFromParentViewController];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(![password isEqualToString:confirmPassword]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Password does not match" message:@"Please ensure that your passwords match" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert removeFromParentViewController];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else{
        PFUser *newUser = [PFUser user];
        newUser.email = email;
        newUser.username = email;
        newUser.password = password;
        newUser[@"firstName"] = firstName;
        newUser[@"lastName"] = lastName;
        newUser[@"age"] = age;
        newUser[@"meds"] = [self userMedications];
        UIView *loading = [self.animator showLoadingViewInView:self.view];
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
              if (error.code == 208){
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"This account is already linked to another user." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alert addAction:ok];
                    [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 100){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Error, the connection to the server failed." preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 124){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Connection timeout." preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 200){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Please enter username" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 201){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Please enter password" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 1){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"internal server error" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 101){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"object not found" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 103){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"invalid class name" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 111){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"inncorrect type" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              } else if (error.code == 119){
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"forbidden op." preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                  [alert addAction:ok];
                  [self presentViewController:alert animated:YES completion:nil];
              }




            }else{
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    }
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
#pragma mark - UITableViewDelegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.checkedPaths removeObject:indexPath];
        NSLog(@"%@ removed", indexPath);
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.checkedPaths addObject:indexPath];
        NSLog(@"%@ added", indexPath);
    }
}
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
-(LRAnimations *)animator{
    if(!_animator){
        _animator = [[LRAnimations alloc] init];
    }
    return _animator;
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
        NSLog(@"%@", index);
        NSString *text = [self.problemsTableView cellForRowAtIndexPath:index].textLabel.text;
        NSLog(@"%@", text);
        [meds addObject:text];
    }
    return meds;
}
@end
