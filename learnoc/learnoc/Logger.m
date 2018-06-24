//
//  Logger.m
//  learnoc
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "Logger.h"

@implementation Logger
-(void) sayOuch:(NSTimer *)t {
    NSLog(@"Ouch!");
}

-(void) zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed");
}

// called when reciver data
-(void) connection: (NSURLConnection *) connection
    didReceiveData:(nonnull NSData *)data
{
    NSLog(@"reviced %lu bytes", [data length]);
    
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData: data];
}

// called when data is over
-(void) connectionDidFinishLoading: (NSURLConnection *) connection {
    NSLog(@"Got it all!");
    NSString * string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"the whole data %@", string);
}

//called if fetch failed
-(void) connection: (NSURLConnection *) connection
    didFailWithError:(nonnull NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}


@end
