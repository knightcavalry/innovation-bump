//
//  textshareAppDelegate.m
//  TextShare
//
//  Created by Fauzan, Muhammad - CW on 3/28/13.
//  Copyright (c) 2013 Fauzan, Muhammad - CW. All rights reserved.
//

#import "textshareAppDelegate.h"
#import "textshareViewController.h"
#import "textshareBumpController.h"
#import "BumpClient.h"
@implementation textshareAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;


- (void)dealloc
{
    _window = nil;
    _viewController = nil;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = NO;
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[textshareViewController alloc] initWithNibName:@"textShareView" bundle:nil];
    } else {
        self.viewController = [[textshareViewController alloc] initWithNibName:@"TextShareMainBoard_iPhone" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    [textshareBumpController configureBump:self.viewController];
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) setFriendMessage:(NSString *) message{
    [self.viewController setFriendMessage:message];
}

- (NSString *) getYourThoughts{
    return [self.viewController getYourThoughts];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    if ([notification.alertAction compare:@"BUMP!"]) {
        [self.viewController startBumping];
    }
    NSLog(@"message : %@", notification.alertAction);
    [self.viewController startBumping];

}

@end
