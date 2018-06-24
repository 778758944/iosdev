//
//  cartest.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main() {
    @autoreleasepool {
        Car * car = [Car new];
        NSMutableString * str = [NSMutableString stringWithCapacity: 10];
        [str appendString:@"Honda"];
        [car setName:str];
        [car print];
        
        [str appendString:@"Japan"];
        [car print];
    }
}
