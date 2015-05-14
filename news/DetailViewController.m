#import "DetailViewController.h"

@implementation DetailViewController

-(id)initWithNSDate:(NSDate *)nsdate query:(NSDictionary*)query{
    if (self = [super init]){
        //NSLog(@"DetailViewController initWithNSDate");
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _opt = [query objectForKey:@"opt"];
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        [fmt setDateFormat:@"yyyy-MM-dd"];
        
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: nsdate];
        
        NSDate *date = [nsdate dateByAddingTimeInterval: interval];
        _date = [fmt stringFromDate:date];
        
        self.title = [NSString stringWithFormat:@"%@ %@", _date, [query objectForKey:@"title"]];
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44)];
        [self.view addSubview:_webView];
        
        [self startTask];
    }
    return self;
}


-(void) startTask{
    [Constants displayLoadingWithView:self.view];
    
    NSString *url = [NSString stringWithFormat:@"http://www.cathassist.org/getstuff/getstuff.php?date=%@&type=json", _date];
    
    _getNewsItems = [[GetJSON alloc] initWithURL:url];
    _getNewsItems.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    _getNewsItems.attr = _opt;
    _getNewsItems.delegate = self;
    [_getNewsItems obtainNow];
}

-(void)obtainedSuccessful:(NSString *)returnedString{
    [_webView loadHTMLString:returnedString baseURL:nil];
    [Constants dismissLoadingWithView:self.view];
}

//================================Connection Error================================//
- (void)obtainedFailed:(NSError *)error
{
    NSLog(@"obtainedFailed with error=%@", error);
    [Constants dismissLoadingWithView:self.view];
    [Constants displayRetryUIWithView:self.view Selector:@selector(reloadView:) Delegate:self];
}

-(void)reloadView:(id)sender{
    [Constants dismissRetryUIWithView:self.view];
    [self startTask];
}
//================================Connection Error================================//
@end
