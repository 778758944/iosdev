//
//  testproperty.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "AllWeatherRadial.h"

int main(void) {
    @autoreleasepool {
        AllWeatherRadial * tire = [AllWeatherRadial new];
        tire.snowHandling = 11.0;
        [tire setRainHandling:1111.1];
        NSLog(@"snowHandling is %.2f, rainHandling is %.2f", tire.snowHandling, [tire rainHandling]);
    }
    return 0;
}
