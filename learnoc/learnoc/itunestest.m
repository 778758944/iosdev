//
//  itunestest.m
//  learnoc
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesFinder.h"

int main() {
    @autoreleasepool {
        NSNetServiceBrowser * browser;
        browser = [[NSNetServiceBrowser alloc] init];
        
        ITunesFinder * finder;
        finder = [[ITunesFinder alloc] init];
        
        // use delegate
        [browser setDelegate: finder];
        [browser searchForServicesOfType: @"_daap._tcp" inDomain:@"local."];
        
        NSLog(@"begin browsing");
        [[NSRunLoop currentRunLoop] run];
        
        return 0;
        
        
    }
}
