//
//  LiturgicWrapper.h
//  news
//
//  Created by Peter on 15/5/13.
//
//

#ifndef news_LiturgicWrapper_h
#define news_LiturgicWrapper_h

#import <Foundation/Foundation.h>

@interface Liturgic : NSObject{

    
}

+(void) initCalendar;
+(void) releaseCalendar;
+(NSArray *) getLitugicDay : (NSInteger) year : (NSInteger) month : (NSInteger) day;

@end

#endif
