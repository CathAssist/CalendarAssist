#import <UIKit/UIKit.h>
#import "NewsItem.h"
#import "NSString+HTML.h"

@protocol GetJSONDelegate <NSObject>

@required
-(void) obtainedSuccessful: (NSString *)returnedString;
-(void) obtainedFailed: (NSError *)error ;

@optional
-(void) requiredLogin;

@end

@interface GetJSON : NSObject
{
    NSString        *_returnedString;
    NSString        *_url;

    NSURLConnection         *_contentConnection;
    NSMutableData           *_receivedData;
}

@property (nonatomic, strong) NSString *attr;
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, weak) id<GetJSONDelegate> delegate;

- (id)initWithURL:(NSString *)url;
- (void) obtainNow;
@end
