//
//  LRLoginViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRLoginViewController.h"
#import "LRAnimations.h"
@import Parse;
@interface LRLoginViewController()
@property (strong, nonatomic) LRAnimations *animator;
@end
@implementation LRLoginViewController
//Okay, bitches, it's time to fuck shit up
-(IBAction)logIn{
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (email.length == 0 || password.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"You must enter your email address & password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert removeFromParentViewController];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    //parse shit here//
    UIView *loading = [self.animator showLoadingViewInView:self.view];
    [PFUser logInWithUsernameInBackground:email password:password block:^(PFUser *user, NSError *error) {
        [self.animator removeLoadingView:loading];
        if(error){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"An error occurred. Please try again." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

  
  
@end
