//
//  ViewController.h
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotateViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView* containerView;
@property (strong, nonatomic) RotateViewController* rotateVC;

@end

