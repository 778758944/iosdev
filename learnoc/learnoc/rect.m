//
//  rect.m
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "./rect.h"

@implementation Rectangel

-(void) setFillColor:(ShapeColor) c {
    if (c == kRedColor) {
        c = kGreenColor;
    }
    
    [super setFillColor:c];
}

-(void) draw {
    NSLog(@"rect is %d, %d, %d, %d, color is %d\n", bounds.x, bounds.y, bounds.height, bounds.width, FillColor);
}

@end
