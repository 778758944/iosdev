//
//  engine.m
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "engine.h"

@implementation Engine
-(NSString *) description {
    return @"I am an engine";
}
-(id) copyWithZone:(NSZone *) zone {
    Engine * engineCopy;
    engineCopy = [[[self class] allocWithZone: zone] init];
    return engineCopy;
}
@end
