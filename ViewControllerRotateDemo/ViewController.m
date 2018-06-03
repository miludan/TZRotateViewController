//
//  ViewController.m
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.rotateVC = [[TZRotateViewController alloc] init];
    [self addChildViewController:self.rotateVC];
    [self.rotateVC.view layoutIfNeeded];
    
    [self.containerView addSubview:self.rotateVC.contentView];
    self.rotateVC.contentView.frame = self.containerView.bounds;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
