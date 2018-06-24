//
//  Car.m
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@protocol NSCopying
-(id) copyWithZone: (NSZone *) zone
@end

@implementation Car
@synthesize name;
@synthesize price;
-(id) init {
    if (self = [super init]) {
        engine = [Engine new];
        tires[0] = [Tire new];
        tires[1] = [Tire new];
        tires[2] = [Tire new];
        tires[3] = [Tire new];
        name = [[NSString alloc] initWithFormat:@"Car"];
        price = 12.2;
    }
    return self;
}

-(void) print {
    NSLog(@"%@", engine);
    NSLog(@"%@", tires[0]);
    NSLog(@"%@", tires[1]);
    NSLog(@"%@", tires[2]);
    NSLog(@"%@", tires[3]);
    NSLog(@"%@", name);
    NSLog(@"%.2f", price);
}

-(Engine *) engine {
    return engine;
}

-(void) setEngine: (Engine *) e {
    engine = e;
}

-(id) copyWithZone: (NSZone *) zone {
    Engine *engineCopy;
    engineCopy = [[[self class] allocWithZone: zone] init];
    return engineCopy;
}

@end
