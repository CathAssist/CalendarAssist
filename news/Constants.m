//
//  Constants.m
//  news
//
//  Created by  user on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (void) displayLoadingWithView:(UIView *)view{
    IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
    display.type = NotificationDisplayTypeLoading;
    display.tag = NOTIFICATION_DISPLAY_TAG;
    [display displayInView:view atCenter:CGPointMake(view.center.x, 200) withInterval:0.0];
}

+ (void) dismissLoadingWithView:(UIView *)view{
    [[view viewWithTag:NOTIFICATION_DISPLAY_TAG] removeFromSuperview];
}

+ (void) displayRetryUIWithView:(UIView *)view Selector:(SEL)selector Delegate:(id)delegate{
    if ([view viewWithTag:DISCONNECT_UI_TAG] == nil)
    {
        UIView *darkView = [[UIView alloc] initWithFrame:view.bounds];
        darkView.alpha = 0.5;
        darkView.backgroundColor = [UIColor blackColor];
        darkView.tag = DISCONNECT_UI_TAG;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(320/2-100, 160, 200, 50);
        [button setTitle:@"連線錯誤!! [按此重試]" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button addTarget:delegate action:selector  forControlEvents: UIControlEventTouchUpInside];
        button.tag = DISCONNECT_UI_TAG;
        [view addSubview:darkView];
        [view addSubview:button];
    }
}

+ (void) dismissRetryUIWithView:(UIView *)view{
    for (UIView *subview in [view subviews])
        if (subview.tag == DISCONNECT_UI_TAG)
            [subview removeFromSuperview];
}

+ (NSArray *) getYMDFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    return [NSArray arrayWithObjects:[NSNumber numberWithInteger:[components year]], [NSNumber numberWithInteger:[components month]], [NSNumber numberWithInteger:[components day]], nil];
}

@end
