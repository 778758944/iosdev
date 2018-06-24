//
//  main2.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RetainTracker.h"

int main(int argc, char **argv) {
    NSAutoreleasePool * pool;
    pool = [[NSAutoreleasePool alloc] init];
    
    RetainTracker *track;
    track = [RetainTracker new];
    [track retain];
    NSLog(@"%lu", [track retainCount]);
    [track autorelease];
    [track release];
    NSLog(@"%lu", [track retainCount]);
    NSLog(@"releasing pool");
    [pool release];
//    NSLog(@"%lu", [track retainCount]);
    
    @autoreleasepool {
        RetainTracker * track2;
        track2 = [RetainTracker new];
        [track2 retain];
        [track2 autorelease];
        [track2 release];
        
        NSLog(@"auto releasing pool");
    }
}
