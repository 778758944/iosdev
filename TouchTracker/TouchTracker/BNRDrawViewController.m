//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by xiaobo on 2018/6/25.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController
-(void) loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}
@end
