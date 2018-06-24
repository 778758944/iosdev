//
//  AllWeatherRadial.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "AllWeatherRadial.h"

@implementation AllWeatherRadial
@synthesize rainHandling;
@synthesize snowHandling;
-(id) init {
    if (self = [super init]) {
        rainHandling = 23.7;
        snowHandling = 42.5;
    }
    
    return self;
}

-(NSString *) description {
    NSString * desc = [NSString alloc];
    [desc initWithFormat:@"snowHandling %.2f, rainHandling %.2f", snowHandling, rainHandling];
    return desc;
}
@end
