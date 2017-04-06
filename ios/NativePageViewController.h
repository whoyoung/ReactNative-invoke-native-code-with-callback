//
//  NativePageViewController.h
//  ReactNativeInvokeNativeCode
//
//  Created by 杨虎 on 2017/4/6.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,CallBackType) {
  CallBackNo = 0,
  CallBackBlock,
  CallBackDelegate,
  CallBackNotification
};

typedef void(^callBackBlock) (NSString *changeTitle);

@protocol NativePageViewControllerDelegate <NSObject>

@optional
- (void)delegateBtnClick:(NSString *)changeTitle;

@end

@interface NativePageViewController : UIViewController
@property (nonatomic,assign) CallBackType callBackType;
@property (nonatomic,copy) callBackBlock block;
@property (nonatomic,weak) id<NativePageViewControllerDelegate> delegate;
@end
