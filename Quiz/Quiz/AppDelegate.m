//
//  AppDelegate.m
//  Quiz
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRQuizViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BNRQuizViewController * quizVC = [[BNRQuizViewController alloc] init];
    [quizVC initQ:@"what is your name" and:@"my name is Tom"];
    
    BNRQuizViewController * quizVC2 = [BNRQuizViewController new];
    [quizVC2 initQ:@"what you age?" and:@"12"];
    
    BNRQuizViewController * quizVC3 = [BNRQuizViewController new];
    [quizVC3 initQ:@"what is your gender" and:@"female"];
    
    
    UITabBarController * tab = [[UITabBarController alloc] init];
    
    tab.viewControllers = @[quizVC, quizVC2, quizVC3];
    
    
    
    self.window.rootViewController = tab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    // Override point for customization after application launch.
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
