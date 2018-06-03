//
//  DismissAnimation.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//

#import "TZDismissAnimation.h"

@implementation TZDismissAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *transitionView = transitionContext.containerView;
    
    toView.frame = UIScreen.mainScreen.bounds;
    
    [transitionView insertSubview:toView belowSubview:fromView];
    
    //adjust original view frame
    [toView layoutIfNeeded];
    
    CGRect originalRect = [self.superView convertRect:self.superView.bounds toView:UIApplication.sharedApplication.delegate.window];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformIdentity;
        fromView.frame = originalRect;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        fromView.frame = originalRect;
        [fromView removeFromSuperview];
        [transitionContext completeTransition:YES];
        
        fromView.transform = CGAffineTransformIdentity;
        [self.superView addSubview:fromView];
        fromView.frame = self.superView.bounds;
    }];
}

@end
