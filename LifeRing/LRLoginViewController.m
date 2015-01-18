//
//  LRLoginViewController.m
//  LifeRing
//
//  Created by Michael Hulet on 1/16/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRLoginViewController.h"
#import "LRAnimations.h"
#import "LRColorScheme.h"
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
    UIView *loading = [self.animator showLoadingViewInView:self.view];
    //parse shit here//
    [PFUser logInWithUsernameInBackground:email password:password block:^(PFUser *user, NSError *error) {
        [self.animator removeLoadingView:loading];
        if(error){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"An error occurred. Please try again." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 100){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Error, the connection to the server failed." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 124){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Connection timeout." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 200){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Please enter username" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 201){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"Please enter password" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 1){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"internal server error" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 101){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"object not found" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 103){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"invalid class name" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 111){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"inncorrect type" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 119){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"forbidden op." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert removeFromParentViewController];

            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (error.code == 202){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Whoops!" message:@"username already taken" preferredStyle:UIAlertControllerStyleAlert];
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

#pragma mark - Property Lazy Instantiation
-(LRAnimations *)animator{
    if(!_animator){
        _animator = [[LRAnimations alloc] init];
    }
    return _animator;
}
#pragma mark - View Setup Code
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
