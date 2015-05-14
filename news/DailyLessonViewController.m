//
//  DailyLessonViewController.m
//  news
//
//  Created by Administrator on 14/5/15.
//
//

#import "DailyLessonViewController.h"

@implementation DailyLessonViewController

-(id)initWithNSDate:(NSDate *)nsdate query:(NSDictionary*)query{
    if (self = [super init]){
        _nsdate = nsdate;
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:_nsdate];

    self.title = [NSString stringWithFormat:@"%@ %@", strDate, @"日课"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 44) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.scrollEnabled = NO;
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"弥撒", @"日祷", @"夜祷", @"诵读", @"晨祷", @"反省", @"礼仪", @"晚祷", @"圣人传记", nil];
    
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.textColor = kBlueText;
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *optDict;
    if (indexPath.row == 0)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"mass", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 1)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"med", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 2)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"comp", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 3)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"let", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 4)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"lod", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 5)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"thought", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 6)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"ordo", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 7)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"ves", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    else if (indexPath.row == 8)
        optDict = [NSDictionary dictionaryWithObjectsAndKeys:@"saint", @"opt", [_dataArray objectAtIndex:indexPath.row], @"title", nil];
    
    DetailViewController *controller = [[DetailViewController alloc] initWithNSDate:_nsdate query:optDict];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
