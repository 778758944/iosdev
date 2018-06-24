//
//  tire.m
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tire.h"
@implementation Tire
@synthesize pressure;
@synthesize treadDepth;

-(id) init {
    if (self = [super init]) {
        pressure = 34.0;
        treadDepth = 20.0;
    }
    return self;
}

-(NSString *) description {
    return @"I am a tire";
}

-(id) initWithPressure: (float) press treadDepth: (float) tread {
    if (self = [super init]) {
        pressure = press;
        treadDepth = tread;
    }
    return self;
}

-(id) copyWithZone:(NSZone *)zone {
    Tire * tireCopy;
    tireCopy = [[[self class] allocWithZone:zone] initWithPressure: pressure treadDepth:treadDepth];
    return tireCopy;
}
@end

