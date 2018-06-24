//
//  ITunesFinder.m
//  learnoc
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "ITunesFinder.h"

@implementation ITunesFinder
-(void) netServiceBrowser: (NSNetServiceBrowser *) b
        didFindService: (NSNetService *) service
        moreComing: (BOOL) moreComing
{
    [service resolveWithTimeout:10];
    NSLog(@"found one Name is %@", [service name]);
}

-(void) netServiceBrowser: (NSNetServiceBrowser *)b
        didRemoveService: (NSNetService *) service
              moreComing: (BOOL) moreComing
{
    [service resolveWithTimeout:10];
    NSLog(@"lost one! Name is %@", [service name]);
}
@end
