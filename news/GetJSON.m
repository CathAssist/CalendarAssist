#import "GetJSON.h"

@implementation GetJSON
@synthesize delegate;

- (id)initWithURL:(NSString *)url{
    if ((self = [super init])) {
        _url = [[NSString alloc] initWithString:url];
        _cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return self;
}

- (void) obtainNow{
    _url = [_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", _url);
    //NSURLRequestReturnCacheDataElseLoad <--use cache forever
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:_cachePolicy timeoutInterval:60.0];
    
    _contentConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (_receivedData == nil)
        _receivedData = [[NSMutableData alloc] initWithCapacity:2048];
    
    [_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //NSLog(@"finished inside GetArray");
    if (_receivedData == nil)
    {
        [self connection:connection didFailWithError:nil];
        return;
    }
    
    NSError *e = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:_receivedData options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonDict) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        if ([jsonDict objectForKey:_attr] != nil)
            _returnedString = [[jsonDict objectForKey:_attr] stringByDecodingHTMLEntities];
    }
    
    if ([delegate respondsToSelector:@selector(obtainedSuccessful:)])
        [delegate obtainedSuccessful:_returnedString];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error is %ld", (long)error.code);
    _receivedData = nil;
    
    if ([delegate respondsToSelector:@selector(obtainedFailed:)])
        [delegate obtainedFailed:error];
}
@end
