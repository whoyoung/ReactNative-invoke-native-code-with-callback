//
//  AppEventEmitter.h
//  ReactNativeInvokeNativeCode
//
//  Created by young on 2017/4/7.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface AppEventEmitter : NSObject
+ (void)sendAppEvent:(NSString *)eventName body:(NSDictionary *)dict;
@end
