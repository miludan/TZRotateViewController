//
//  RotateViewController.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import "TZRotateViewController.h"
#import "TZRotateManager.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orentataionDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orentataionDidChange:(NSNotification*)noti {
    UIDevice* device = noti.object;
    
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"notification:::home button on the right");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"notification:::home button on the left");;
            break;
        case UIDeviceOrientationFaceUp:
            break;
        case UIDeviceOrientationFaceDown:
        default:
            break;
    }
    
    if (device.orientation == UIDeviceOrientationLandscapeLeft || device.orientation == UIDeviceOrientationLandscapeRight) {
        if (!self.presentingViewController) {
            [[TZRotateManager sharedInstance] transformToFullScreen:self];
        }
        
    }else if (device.orientation == UIDeviceOrientationPortrait) {
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        NSLog(@"notification:::%@", @(device.orientation));
    }
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

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Public Method
- (IBAction)transform:(id)sender {
    if (self.presentingViewController) {
        //transform to embadded
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        //transform to fullscreen
        [[TZRotateManager sharedInstance] transformToFullScreen:self];
    }
}

@end
