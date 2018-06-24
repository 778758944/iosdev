//
//  block.m
//  learnoc
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Demo : NSObject
@property(assign) NSString * name;
@end

@implementation Demo
@synthesize name;
@end
int main() {
    @autoreleasepool {
        NSArray * oldStrings = [NSArray arrayWithObjects: @"Sand", @"Yarn", @"old", nil];
        NSMutableArray * newStrings = [[NSMutableArray alloc] initWithCapacity:10];
        NSArray * vowels = [NSArray arrayWithObjects: @"a", @"e", @"i", @"o", @"u", nil];
        
        void (^devowelizer)(id, NSUInteger, BOOL *);
        devowelizer = ^(id string, NSUInteger i, BOOL * stop) {
            NSRange yRange = [string rangeOfString: @"y" options: NSCaseInsensitiveSearch];
            if (yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            NSMutableString * newString = [NSMutableString stringWithString: string];
            for(NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [newStrings addObject: newString];
        };
        [oldStrings enumerateObjectsUsingBlock:^ (id string, NSUInteger i, BOOL * stop) {
            NSMutableString * newString = [NSMutableString stringWithString:string];
            for (NSString *a in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:a withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [newStrings addObject:newString];
        }];
        NSLog(@"newstring %@", newStrings);
    }
    
    void (^test) (void);
    Demo * demo = [Demo new];
    test = ^() {
        NSString * str = @"hello";
        demo.name = str;
    };
    
    test();
    NSLog(@"%@", demo.name);
    
    return 0;
}
