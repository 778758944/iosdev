//
//  RetainTracker.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "RetainTracker.h"

@implementation RetainTracker
    -(id) init {
        if (self == [super init]) {
            NSLog(@"retainCount is %lu\n", (unsigned long)[self retainCount]);
        }
        return self;
    }
    
    -(void) dealloc {
        NSLog(@"dealloc called, bye");
        [super dealloc];
    }
@end
