//
//  TZRotateManager.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/4/17.
//

#import "TZRotateManager.h"
#import "TZRotateViewController.h"

@interface TZRotateManager()<UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) TZRotateViewController* presentedVC;
@property (strong, nonatomic) UIView* superView;
@property (strong, nonatomic) TZPresentAnimation* presentAnimation;
@property (strong, nonatomic) TZDismissAnimation* dismissAnimation;
@property (assign, nonatomic) UIInterfaceOrientation statusBarOrientation;

@end

@implementation TZRotateManager

+ (instancetype)sharedInstance {
    static TZRotateManager* shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shared == nil) {
            shared = [[TZRotateManager alloc] init];
        }
    });
    return shared;
}

- (UIViewController*)getRootViewController:(UIViewController*)rootViewController {
    if (rootViewController) {
        if (rootViewController.presentedViewController != nil) {
            return [self getRootViewController:rootViewController.presentedViewController];
        }else {
            return rootViewController;
        }
    }else {
        UIViewController* vc = UIApplication.sharedApplication.keyWindow.rootViewController;
        return [self getRootViewController:vc];
    }
}

- (void)transformToFullScreen:(TZRotateViewController *)vc {
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [vc removeFromParentViewController];
    self.presentedVC = vc;
    self.superView = vc.contentView.superview;
    self.statusBarOrientation = UIApplication.sharedApplication.statusBarOrientation;
    UIViewController* rootVC = [self getRootViewController:nil];
    
    [rootVC presentViewController:vc animated:YES completion:nil];
}

//- (void)transformToEmbeddedScreen {
//
//}

#pragma mark - UIViewControllerTransitioningDelegateMethod
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if (!self.dismissAnimation) {
        self.dismissAnimation = [TZDismissAnimation instanceWith:self.presentedVC statusBarOrientation:self.statusBarOrientation superView:self.superView];
    }
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if (!self.presentAnimation) {
        self.presentAnimation = [TZPresentAnimation instanceWith:self.presentedVC statusBarOrientation:self.statusBarOrientation superView:self.superView];
    }
    return self.presentAnimation;
}

@end
