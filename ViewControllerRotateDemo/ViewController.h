//
//  ViewController.h
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/3/30.
//

#import <UIKit/UIKit.h>
#import "TZRotateViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView* containerView;
@property (strong, nonatomic) TZRotateViewController* rotateVC;

@end

