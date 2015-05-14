//
//  NewsItem.h
//  news
//
//  Created by  user on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsItem : NSObject {
    NSString *title;
    NSDate   *nsdate;
    NSString *color;
}
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *nsdate;
@property (nonatomic, strong) NSString *color;
@end
