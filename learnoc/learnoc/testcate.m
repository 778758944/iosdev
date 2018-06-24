//
//  testcate.m
//  learnoc
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (NumberConvenience)
- (NSNumber *) lengthAsNumber;

@end

@implementation NSString (NumberConvenience)
-(NSNumber *) lengthAsNumber {
    unsigned long length = [self length];
    return [NSNumber numberWithUnsignedLong:length];
}

@end



int main() {
    @autoreleasepool {
        NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity: 10];
        
        [dict setObject: [@"hello" lengthAsNumber] forKey: @"hello"];
        [dict setObject: [@"world" lengthAsNumber] forKey: @"world"];
        NSLog(@"%@", dict);
    }
    return 0;
}
