//
//  NSString+Encode.m
//  news
//
//  Created by  user on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Encode.h"


@implementation NSString (encode)
- (NSString *)encodeString:(NSStringEncoding)encoding
{
    return (NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self,
                                                                NULL, (CFStringRef)@";/?:@&=$+{}<>,",
                                                                CFStringConvertNSStringEncodingToEncoding(encoding));
}  
@end