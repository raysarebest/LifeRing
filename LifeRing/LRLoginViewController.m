//
//  LRLoginViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRLoginViewController.h"
#import <Parse/Parse.h>
@implementation LRLoginViewController
//Okay, bitches, it's time to fuck shit up



-(IBAction)logIn{
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //parse shit here//
    [PFUser logInWithUsernameInBackground:email password:password block:^(PFUser *user, NSError *error) {
    
}];
    if ([email length] == 0 || [password length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"You must enter your email address & password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }


}

  
  
@end
