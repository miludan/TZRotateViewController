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

@class TZRotateViewController;

@interface TZRotateManager : NSObject

+ (instancetype)sharedInstance;

- (void)transformToFullScreen:(TZRotateViewController*)vc;
//- (void)transformToEmbeddedScreen;

@end
