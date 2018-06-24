//
//  categary.m
//  learnoc
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "categary.h"

@implementation NSString (NumberConvenience)
-(NSNumber *) lengthAsNumber {
    unsigned long length = [self length];
    return [NSNumber numberWithUnsignedLong:length];
}

@end
