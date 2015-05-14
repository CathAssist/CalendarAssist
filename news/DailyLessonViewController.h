//
//  DailyLessonViewController.h
//  news
//
//  Created by Administrator on 14/5/15.
//
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface DailyLessonViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView                 *_tableView;
    NSMutableArray              *_dataArray;
    
    NSDate                      *_nsdate;
}

-(id)initWithNSDate:(NSDate *)nsdate query:(NSDictionary*)query;
@end
