//
//  TZRotateManager.h
//  ViewControllerRotateDemo
//
//  Created by Tomas_Zhang on 2018/4/17.
//  Copyright © 2018年 Neulion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZDismissAnimation.h"
#import "TZPresentAnimation.h"

@interface TZRotateManager : NSObject

@property (weak, nonatomic)   UIView* superView;
@property (assign, nonatomic) UIInterfaceOrientation originalOrientation;

- (void)transformToFullScreen;
- (void)transformToEmbeddedScreen;

@end
