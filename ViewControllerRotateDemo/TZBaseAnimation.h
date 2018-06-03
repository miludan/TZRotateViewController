//
//  BaseAnimation.h
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//

#import <Foundation/Foundation.h>
#import "TZRotateViewController.h"

@interface TZBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (weak  , nonatomic) TZRotateViewController* presentedVC;
@property (assign, nonatomic) UIInterfaceOrientation  statusBarOrientation;
@property (weak  , nonatomic) UIView* superView;

+ (instancetype)instanceWith:(TZRotateViewController*)presentedVC statusBarOrientation:(UIInterfaceOrientation)statusBarOrientation superView:(UIView*)superView;

@end
