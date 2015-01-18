//
//  LRAnimations.h
//  LifeRing
//
//  Created by Michael Hulet on 1/17/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

@import Foundation;
@import UIKit;
@interface LRAnimations : NSObject
-(UIView *)showLoadingViewInView:(UIView *)superView;
-(void)removeLoadingView:(UIView *)loading;
@end
