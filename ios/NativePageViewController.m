//
//  NativePageViewController.m
//  ReactNativeInvokeNativeCode
//
//  Created by 杨虎 on 2017/4/6.
//  Copyright © 2017年 Facebook. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "NativePageViewController.h"

@interface NativePageViewController ()

@end

@implementation NativePageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  self.title = @"Native Page";
  UIButton *noCallBackBtn;
  switch (self.callBackType) {
    case CallBackNo:
      noCallBackBtn = [self callBackBtn:@"noCallBack" action:@selector(noCallBackBtnClick)];
      break;
    case CallBackBlock:
      noCallBackBtn = [self callBackBtn:@"block" action:@selector(blockBtnClick)];
      break;
    case CallBackDelegate:
      noCallBackBtn = [self callBackBtn:@"delegate" action:@selector(delegateBtnClick)];
      break;
    case CallBackNotification:
      noCallBackBtn = [self callBackBtn:@"notification" action:@selector(notificationBtnClick)];
      break;
    default: noCallBackBtn = [self callBackBtn:@"noCallBack" action:@selector(noCallBackBtnClick)];
      break;
  }
  
  [self.view addSubview:noCallBackBtn];
  
}

- (UIButton *)callBackBtn:(NSString *)title action:(SEL)sel {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setTitle:title forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [btn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:130/255.0 blue:25/255.0 alpha:1]];
  [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
  btn.frame = CGRectMake(kScreenWidth/4.0, kScreenHeight/2.0, kScreenWidth/2.0, 30);
  return btn;
}

- (void)noCallBackBtnClick {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)blockBtnClick {
  if (self.block) {
    self.block(@"blockChanged");
  }
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)delegateBtnClick {
  if (self.delegate && [self.delegate respondsToSelector:@selector(delegateBtnClick:)]) {
    [self.delegate delegateBtnClick:@"delegateChanged"];
  }
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)notificationBtnClick {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
