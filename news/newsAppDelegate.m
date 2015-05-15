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

    NSString *version = [[UIDevice currentDevice] systemVersion];
    
    //iOS 7+
    if ([version floatValue] < 8.0)
    {
        [self scheduleLocalNotification];
    }
    else {
    //iOS 8+ requires user permission for Local notification
        if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
            UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
        }
    }
    
    CalViewController *controller = [[CalViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#ifdef __IPHONE_8_0
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"didRegisterUserNotificationSettings");
    [self scheduleLocalNotification];
}
#endif

-(void) scheduleLocalNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    NSDate *tmpDate = [NSDate date];
    //max number of Local Notification is 64
    int i = 1;
    while (i < 65)
    {
        int hasEvent = 0;
        while (hasEvent == 0) {
            NSArray *ymd = [Constants getYMDFromDate:tmpDate];
            NSArray* events = [Liturgic getLitugicDay:[ymd[0] intValue]:[ymd[1] intValue]:[ymd[2] intValue]];

            if ([events count] > 1)
            {
                NSString *content = @"";
                for (int j = 1; j < [events count]; j++)
                {
                    content = [content stringByAppendingString:[events objectAtIndex:j]];
                    content = [content stringByAppendingString:@"\n"];
                }
                
                UILocalNotification* localNotification = [[UILocalNotification alloc] init];
                
                //for debug purpose, notify every 5 seconds
                //localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:i * 5];
                
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:tmpDate];
                [components setHour:9];
                [components setMinute:0];
                NSDate *dateWithTime = [calendar dateFromComponents:components];
                
                localNotification.fireDate = dateWithTime;
                
                localNotification.alertBody = [NSString stringWithFormat:@"%@", content];
                localNotification.timeZone = [NSTimeZone defaultTimeZone];
                [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
                
                hasEvent = 1;
            }
            
            //add 1 to the tmpDate
            tmpDate = [calendar dateByAddingComponents:dayComponent toDate:tmpDate options:0];
        }
        i++;
    }
    
    //verified scheduled notifications in Console for debugging
    /*
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    i = 1;
    for (UILocalNotification *localNotification in localNotifications) {
        NSLog(@"%d) scheduled: %@ %@", i++, localNotification.fireDate, localNotification.alertBody);
    }*/
}
@end
