//
//  YHCallBackModule.m
//  ReactNativeInvokeNativeCode
//
//  Created by 杨虎 on 2017/4/6.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "YHCallBackModule.h"
#import "NativePageViewController.h"

@implementation YHCallBackModule
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(pushNoCallBack) {
  UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:nil];
  navController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
  navController.navigationBar.barTintColor = [UIColor blueColor];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackNo;
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}

RCT_REMAP_METHOD(pushBlockCallBack,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:nil];
  navController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
  navController.navigationBar.barTintColor = [UIColor blueColor];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackBlock;
  nativePageVC.block = ^(NSString *title) {
    resolve(title);
  };
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}
@end
