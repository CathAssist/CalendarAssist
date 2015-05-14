//
//  CalendarViewController.m
//  news
//
//  Created by  user on 4/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CalViewController.h"

@implementation CalViewController

- (id)init
{
    if (self = [super init]) {
        
        self.title = @"教會日曆";
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        _header = [[FSCalendarHeader alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 44, 320, 280)];
        _calendar.header = _header;
        _calendar.delegate = self;
        _calendar.dataSource = self;
        
        [_calendar setHeaderDateFormat:@"MMMM yyyy"];
        [_calendar setMinDissolvedAlpha:0.2];
        [_calendar setCellStyle:FSCalendarCellStyleCircle];
        
        [self.view addSubview:_header];
        [self.view addSubview:_calendar];
        
        _dataArray = [[NSMutableArray alloc] init];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 280+45, 320, self.view.frame.size.height - (280+45) - 44) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"今天" style:UIBarButtonItemStyleBordered target:self action:@selector(showAndSelectToday)];
        
        [_calendar setSelectedDate:[NSDate date]];
    }
    return self;
}

- (void)showAndSelectToday
{
    [_calendar setSelectedDate:[NSDate date]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (indexPath.row == 0)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NewsItem *newsItem = [_dataArray objectAtIndex:indexPath.row];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];

    cell.backgroundView = tempView;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.textColor = kBlueText;
    cell.textLabel.text = newsItem.title;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        DailyLessonViewController *controller = [[DailyLessonViewController alloc] initWithNSDate:_calendar.selectedDate query:nil];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark - FSCalendarDataSource

- (NSString *)calendar:(FSCalendar *)calendarView subtitleForDate:(NSDate *)date
{
    return nil;
}

- (BOOL)calendar:(FSCalendar *)calendarView hasEventForDate:(NSDate *)date
{
    NSArray *ymd = [Constants getYMDFromDate:date];
    NSArray* events = [Liturgic getLitugicDay:[ymd[0] intValue]:[ymd[1] intValue]:[ymd[2] intValue]];
    return ([events count] > 0);
}

#pragma mark - FSCalendarDelegate

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
    return YES;
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
    NSLog(@"didSelectDate : %@", date);
    [_dataArray removeAllObjects];
    
    NewsItem *tempNewsItem = [[NewsItem alloc] init];
    tempNewsItem.title = @"日课";
    tempNewsItem.nsdate = date;
    [_dataArray addObject:tempNewsItem];
    
    NSArray *ymd = [Constants getYMDFromDate:date];
    NSArray* events = [Liturgic getLitugicDay:[ymd[0] intValue]:[ymd[1] intValue]:[ymd[2] intValue]];
    NSString* strColor = [events objectAtIndex:0];
    for (int i = 1; i < [events count]; i++)
    {
        NewsItem* item = [[NewsItem alloc] init];
        item.nsdate = date;
        item.title = [NSString stringWithFormat:@"。 %@", [events objectAtIndex:i]];
        item.color = strColor;
        
        [_dataArray addObject:item];
    }
    
    [_tableView reloadData];
}

- (void)calendarCurrentMonthDidChange:(FSCalendar *)calendar
{
    NSLog(@"did change to month %@", calendar.currentMonth);
}



@end
