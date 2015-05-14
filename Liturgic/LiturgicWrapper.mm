//
//  LiturgicWrapper.m
//  news
//
//  Created by Peter on 15/5/13.
//
//

#import <Foundation/Foundation.h>
#import <LiturgicWrapper.h>
#include "Calendar.h"

@implementation Liturgic

+(void) initCalendar
{
    Calendar::initCalendar();
}

+(void) releaseCalendar
{
    Calendar::releaseCalendar();
}

+(NSArray*) getLitugicDay : (NSInteger) year : (NSInteger) month : (NSInteger) day
{
    NSMutableArray* events = [NSMutableArray array];
    
    
    LiturgicDay lDay = Calendar::getLiturgicDay(year, month, day);
    
    std::string cstrColor = CathAssist::Calendar::getColorStr(lDay.getColor());
    
    
    //当天弥撒中所使用的祭衣颜色
    NSString* strColor = [NSString stringWithCString:cstrColor.c_str()
                                            encoding:NSUTF8StringEncoding];
    
    [events addObject:strColor];
    
    std::list<CellInfo> listCells = lDay.getCellInfos();
    
    std::list<CellInfo>::iterator iter = listCells.begin();
    while (iter!=listCells.end())
    {
        NSString* strEvent = [NSString stringWithCString:iter->celebration.c_str()
                                                encoding:NSUTF8StringEncoding];
        
        [events addObject:strEvent];
        ++iter;
    }
    
    return events;
}

@end