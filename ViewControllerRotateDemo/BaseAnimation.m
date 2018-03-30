//
//  BaseAnimation.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "BaseAnimation.h"

@implementation BaseAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

@end
