//
//  YHCallBackModule.m
//  ReactNativeInvokeNativeCode
//
//  Created by 杨虎 on 2017/4/6.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "YHCallBackModule.h"
#import "NativePageViewController.h"
#import "AppDelegate.h"

@interface YHCallBackModule()<NativePageViewControllerDelegate>
@property (nonatomic,strong) RCTPromiseResolveBlock resolve;
@end

@implementation YHCallBackModule
RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

- (AppDelegate *)mainAppDelegate {
  return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

RCT_EXPORT_METHOD(pushNoCallBack) {
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackNo;

  AppDelegate *mainDelegate = [self mainAppDelegate];
  [mainDelegate.rootViewController.navigationController pushViewController:nativePageVC animated:YES];
}

RCT_REMAP_METHOD(pushBlockCallBack,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackBlock;
  nativePageVC.block = ^(NSString *title) {
    resolve(title);
  };
  AppDelegate *mainDelegate = [self mainAppDelegate];
  [mainDelegate.rootViewController.navigationController pushViewController:nativePageVC animated:YES];
}

RCT_REMAP_METHOD(pushDelegateCallBack,
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject) {
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackDelegate;
  nativePageVC.delegate = self;
  _resolve = resolve;
  AppDelegate *mainDelegate = [self mainAppDelegate];
  [mainDelegate.rootViewController.navigationController pushViewController:nativePageVC animated:YES];
}
- (void)delegateBtnClick:(NSString *)changeTitle {
  _resolve(changeTitle);
}

RCT_EXPORT_METHOD(pushNotiCallBack) {
  
  NativePageViewController *nativePageVC = [[NativePageViewController alloc] init];
  nativePageVC.callBackType = CallBackNotification;
  AppDelegate *mainDelegate = [self mainAppDelegate];
  [mainDelegate.rootViewController.navigationController pushViewController:nativePageVC animated:YES];
}


@end
