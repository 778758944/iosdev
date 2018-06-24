//
//  Person.m
//  learnoc
//
//  Created by xiaobo on 2018/6/1.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person
@synthesize name;
@dynamic age;

-(id) initWithAge:(int)initAge {
    age = initAge;
    return self;
}

-(int)age {
    return 29;
}

-(void) introduceMe {
    NSLog(@"Hello, my name is %@", self.name);
}

@end
