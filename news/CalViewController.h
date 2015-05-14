//
//  CalViewController.h
//  news
//
//  Created by Administrator on 14/5/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Constants.h"
#import "FSCalendar.h"
#import "LiturgicWrapper.h"
#import "DailyLessonViewController.h"

@interface CalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FSCalendarDataSource, FSCalendarDelegate> {
    FSCalendar                  *_calendar;
    FSCalendarHeader            *_header;
    
    UITableView                 *_tableView;
    NSMutableArray              *_dataArray;
}

@end