#import <UIKit/UIKit.h>
#import "Constants.h"
#import "GetJSON.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate, GetJSONDelegate>{
    GetJSON             *_getNewsItems;
    UIWebView               *_webView;
    NSString                *_date;
    
    NSString                *_opt;
}

-(id)initWithNSDate:(NSDate *)nsdate query:(NSDictionary*)query;
@end
