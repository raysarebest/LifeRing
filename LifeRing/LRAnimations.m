//
//  LRAnimations.m
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LRAnimations.h"
@interface LRAnimations()
@property (strong, nonatomic) NSMutableArray *runningAnimations;
@end
@implementation LRAnimations
-(UIView *)showLoadingViewInView:(UIView *)superView{
    UIView *loading = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    loading.backgroundColor = [UIColor blackColor];
    loading.alpha = .5;
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    spinner.center = loading.center;
    [spinner startAnimating];
    [loading addSubview:spinner];
    [superView addSubview:loading];
    [self.runningAnimations addObject:loading];
    return loading;
}
-(void)removeLoadingView:(UIView *)loading{
    [loading removeFromSuperview];
    [self.runningAnimations removeObject:loading];
}
#pragma mark - Property Lazy Instantiation
-(NSMutableArray *)runningAnimations{
    if(!_runningAnimations){
        _runningAnimations = [[NSMutableArray alloc] init];
    }
    return _runningAnimations;
}
@end
