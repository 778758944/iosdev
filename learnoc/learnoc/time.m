//
//  time.m
//  learnoc
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"
int main() {
    @autoreleasepool {
        Logger * logger = [Logger new];
        
        // notifaction
//        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserverForName: NSSystemTimeZoneDidChangeNotification object:logger queue:nil usingBlock: ^ (NSNotification * note) {
            NSLog(@"Hello world");
        }];
        
        // target-action
        __unused NSTimer * time = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:YES];
        
        // delegate
        NSURL *url = [NSURL URLWithString:@"http://localhost:9999/websocket.html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection * fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger];
        [[NSRunLoop currentRunLoop] run];
    }
    
    return 0;
}
