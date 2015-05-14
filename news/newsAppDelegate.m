//
//  newsAppDelegate.m
//  news
//
//  Created by  user on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "newsAppDelegate.h"

@implementation newsAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:200 * 1024 * 1024
                                                         diskCapacity:500 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //CalendarViewController *controller = [[CalendarViewController alloc] init];
    CalViewController *controller = [[CalViewController alloc] init];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end