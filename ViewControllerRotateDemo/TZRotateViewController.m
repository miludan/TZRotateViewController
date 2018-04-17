//
//  RotateViewController.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "TZRotateViewController.h"

@interface TZRotateViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation TZRotateViewController

- (id)init {
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Public Method
- (IBAction)transform:(id)sender {
    if (self.presentingViewController) {
        //transform to embadded
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        //transform to fullscreen
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:self animated:YES completion:nil];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate Method
- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return nil;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return nil;
}

@end
