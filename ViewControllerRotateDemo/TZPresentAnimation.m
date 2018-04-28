//
//  PresentAnimation.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "TZPresentAnimation.h"

@implementation TZPresentAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView* transitionView = transitionContext.containerView;
    UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [toView addSubview:self.presentedVC.contentView];
    self.presentedVC.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.presentedVC.contentView.frame = toView.bounds;
    
    [transitionView addSubview:toView];
    
    //convert current view bounds to window
    CGRect currentRect = [self.superView convertRect:self.superView.bounds toView:UIApplication.sharedApplication.delegate.window];
    //get center of view base on the window rect
    CGPoint center = CGPointMake(currentRect.origin.x + currentRect.size.width/2.0 , currentRect.origin.y + currentRect.size.height/2.0);
    
    if (self.statusBarOrientation == UIInterfaceOrientationPortrait) {
        toView.frame = CGRectMake(0, 0, currentRect.size.height, currentRect.size.width);
    }else {
        toView.frame = CGRectMake(0, 0, currentRect.size.width, currentRect.size.height);
    }
    
    //move toView to original center
    toView.center = center;
    
    //transform original view
    if (self.statusBarOrientation == UIInterfaceOrientationPortrait) {
        UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
        if (orientation == UIDeviceOrientationLandscapeLeft) {
            toView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, (-M_PI_2));
        }else if (orientation == UIDeviceOrientationLandscapeRight) {
            toView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, (M_PI_2));
        }else {
            toView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, (-M_PI_2));
        }
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformIdentity;
        toView.frame = transitionView.bounds;
    } completion:^(BOOL finished) {
        toView.transform = CGAffineTransformIdentity;
        toView.frame = transitionView.bounds;
        
        [transitionView addSubview:toView];
        [transitionContext completeTransition:YES];
    }];
}

@end
