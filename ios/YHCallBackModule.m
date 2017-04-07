//
//  YHCallBackModule.m
//  ReactNativeInvokeNativeCode
//
//  Created by 杨虎 on 2017/4/6.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "YHCallBackModule.h"
#import "NativePageViewController.h"

@interface YHCallBackModule()<NativePageViewControllerDelegate>
@property (nonatomic,strong) RCTPromiseResolveBlock resolve;
@end

@implementation YHCallBackModule
RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

- (UINavigationController *)navigationCont {
  UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:nil];
  navController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
  navController.navigationBar.barTintColor = [UIColor blueColor];
  return navController;
}

RCT_EXPORT_METHOD(pushNoCallBack) {
  UINavigationController *navController = [self navigationCont];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackNo;
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}

RCT_REMAP_METHOD(pushBlockCallBack,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  UINavigationController *navController = [self navigationCont];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackBlock;
  nativePageVC.block = ^(NSString *title) {
    resolve(title);
  };
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}

RCT_REMAP_METHOD(pushDelegateCallBack,
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject) {
  UINavigationController *navController = [self navigationCont];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackDelegate;
  nativePageVC.delegate = self;
  _resolve = resolve;
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}
- (void)delegateBtnClick:(NSString *)changeTitle {
  _resolve(changeTitle);
}

RCT_EXPORT_METHOD(pushNotiCallBack) {
  UINavigationController *navController = [self navigationCont];
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackNotification;
  navController.viewControllers = @[nativePageVC];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
}


@end
