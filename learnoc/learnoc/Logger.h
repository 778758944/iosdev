//
//  Logger.h
//  learnoc
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject {
    NSMutableData * incomingData;
}
-(void) sayOuch: (NSTimer *) t;
-(void) zoneChange: (NSNotification *) note;
@end
