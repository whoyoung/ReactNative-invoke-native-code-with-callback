//
//  AppEventEmitter.m
//  ReactNativeInvokeNativeCode
//
//  Created by young on 2017/4/7.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "AppEventEmitter.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@implementation AppEventEmitter

+ (void)sendAppEvent:(NSString *)eventName body:(NSDictionary *)dict {
  AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [mainDelegate sendAppEvent:eventName body:dict];
}
@end
