//
//  BaseAnimation.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "TZBaseAnimation.h"

@implementation TZBaseAnimation

+ (instancetype)instanceWith:(TZRotateViewController *)presentedVC statusBarOrientation:(UIInterfaceOrientation)statusBarOrientation superView:(UIView *)superView
{
    TZBaseAnimation* animation = [[[self class] alloc] init];
    if (animation) {
        animation.presentedVC = presentedVC;
        animation.statusBarOrientation = statusBarOrientation;
        animation.superView = superView;
    }
    return animation;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

@end
