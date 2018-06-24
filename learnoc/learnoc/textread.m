//
//  textread.m
//  learnoc
//
//  Created by xiaobo on 2018/6/3.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, char ** argv) {
    @autoreleasepool {
        NSError * err = nil;
        NSString * str = [[NSString alloc] initWithContentsOfFile:@"./test.txt" encoding:NSUTF8StringEncoding error:&err];
        if (err != nil) {
            NSLog(@"Unable to read data from file, %@", [err localizedDescription]);
        }
        NSLog(@"%@", str);
    }
}
