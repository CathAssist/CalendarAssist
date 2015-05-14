//
//  main.m
//  news
//
//  Created by  user on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiturgicWrapper.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [Liturgic initCalendar];
        int retVal = UIApplicationMain(argc, argv, nil, @"newsAppDelegate");
        [Liturgic releaseCalendar];
        return retVal;
    }
}
