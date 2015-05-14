//
//  Constants.h
//  news
//
//  Created by  user on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  
//  Muluapps version description: 2.0
#import "DetailViewController.h"
#import "IFNNotificationDisplay.h"
#import "NewsItem.h"
#import "GetJSON.h"

#define NOTIFICATION_DISPLAY_TAG 55555
#define DISCONNECT_UI_TAG 11111
#define KMASK 22222

#define kBlueText   [UIColor colorWithRed:14/255.0  green:69/255.0  blue:221/255.0    alpha:1.0]
#define kPink       [UIColor colorWithRed:198/255.0 green:51/255.0  blue:42/255.0     alpha:1.0]
#define kBlue       [UIColor colorWithRed:31/255.0  green:119/255.0 blue:219/255.0    alpha:1.0]

@interface Constants : NSObject {
    
}

+ (void) displayLoadingWithView:(UIView *)view;
+ (void) dismissLoadingWithView:(UIView *)view;

+ (void) displayRetryUIWithView:(UIView *)view Selector:(SEL)selector Delegate:(id)delegate;
+ (void) dismissRetryUIWithView:(UIView *)view;

+ (NSArray *) getYMDFromDate:(NSDate *)date;
@end
