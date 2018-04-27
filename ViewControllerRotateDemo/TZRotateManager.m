//
//  TZRotateManager.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/4/17.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "TZRotateManager.h"

@interface TZRotateManager()<UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) TZPresentAnimation* presentAnimation;
@property (strong, nonatomic) TZDismissAnimation* dismissAnimation;

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

- (void)transformToFullScreen:(UIViewController *)vc {
    
}

- (void)transformToEmbeddedScreen {
    
}

#pragma mark - UIViewControllerTransitioningDelegateMethod
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if (!self.dismissAnimation) {
        self.dismissAnimation = [[TZDismissAnimation alloc] init];
    }
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if (!self.presentAnimation) {
        self.presentAnimation = [[TZPresentAnimation alloc] init];
    }
    return self.presentAnimation;
}

@end
