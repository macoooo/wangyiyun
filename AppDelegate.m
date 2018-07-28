//
//  AppDelegate.m
//  网易云账号
//
//  Created by 强淑婷 on 2018/7/23.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "AppDelegate.h"
#import "AccountViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //QSTRoot *root = [[QSTRoot alloc] init];
//    self.window.rootViewController = nav;
    UITabBarController *tb = [[UITabBarController alloc]init];
    //设置UIWindow的rootViewController为UITabBarController
    self.window.rootViewController = tb;
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:300/255 green:86/255 blue:89/255 alpha:0.5]];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.tabBarItem.title = @"发现";
    vc1.tabBarItem.image = [UIImage imageNamed:@"发现"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.tabBarItem.title = @"视频";
    vc2.tabBarItem.image = [UIImage imageNamed:@"视频"];
    
    MineViewController *vc3 = [[MineViewController alloc] init];
    vc3.tabBarItem.title = @"我的";
    vc3.tabBarItem.image = [UIImage imageNamed:@"我的"];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.tabBarItem.title = @"朋友";
    vc4.tabBarItem.image = [UIImage imageNamed:@"朋友"];
    
    AccountViewController *vc5 = [[AccountViewController alloc] init];
    vc5.tabBarItem.title = @"账号";
    vc5.tabBarItem.image = [UIImage imageNamed:@"账号"];
    
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *navController4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    UINavigationController *navController5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    
    tb.viewControllers = @[navController1, navController2, navController3, navController4, navController5];
    
    
                            
    
     [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
