/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ReactNativeInvokeNativeCode"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  _rootViewController = [UIViewController new];
  _rootViewController.view = rootView;
  _rootViewController.title = @"React-Native Page";
  UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:nil];
  navController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
  navController.navigationBar.barTintColor = [UIColor blueColor];
  navController.viewControllers = @[_rootViewController];

  self.window.rootViewController = navController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)sendAppEvent:(NSString *)name body:(NSDictionary *)data {
  RCTBridge *bridge = ((RCTRootView *)(self.rootViewController.view)).bridge;
  [bridge enqueueJSCall:@"RCTNativeAppEventEmitter"
                 method:@"emit"
                   args:data ? @[name, data] : @[name]
             completion:NULL];

}
@end
