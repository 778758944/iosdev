//
//  main.m
//  learnoc
//
//  Created by xiaobo on 2018/6/1.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <objc/runtime.h>
#import "Person.h"
#import "rect.h"
#import "Car.h"
#import "RetainTracker.h"

typedef struct book {
    float price;
} Book;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        puts("test c code");
        NSLog(@"Hello, World!");
        
        // test nsstring
        NSString* str = @"My String\n";
        NSString* formatStr = [NSString stringWithFormat:@"%d %@", 1, @"hello"];
        
        // output nsstring
        NSLog(@"%@", str);
        NSLog(@"%@%d", formatStr, 3);
        
        // create a string from c
        NSString* fromc = [NSString stringWithCString:"test" encoding:NSASCIIStringEncoding];
        NSLog(@"%@", fromc);
        
        Person *aPerson = [[Person alloc] initWithAge: 23];
        aPerson.name = @"jack";
        NSLog(@"aPerson age is %d, name is %@\n", aPerson.age, aPerson.name);
        [aPerson introduceMe];
        
        int i;
        unsigned int propertyCount = 0;
        objc_property_t *propertyList = class_copyPropertyList([aPerson class], &propertyCount);
        
        for (i = 0; i < propertyCount; i++) {
            objc_property_t *thisProperty = propertyList + i;
            const char * propertyName = property_getName(*thisProperty);
            NSLog(@"%s\n", propertyName);
        }
        
        
        // inherit
        ShapeRect d = {1, 2, 3, 4};
        Rectangel * r = [Rectangel new];
        [r setFillColor:kRedColor];
        [r setBounds: d];
        [r draw];
        
        Car * car = [Car new];
        [car print];
        
        // foundation
        // NSString
        NSString* str2 = @"Hello, world";
        NSString* str3 = @"hello, world";
        NSUInteger len = [str2 length];
        NSLog(@"length %lu", len);
        
        // str equal
        if ([str3 isEqualToString:str2]) {
            NSLog(@"they are same");
        }
        
        // str compare
        
        NSComparisonResult res = [str2 compare: str3];
        if (res == NSOrderedAscending) {
            NSLog(@"Less than");
        } else if (res == NSOrderedSame){
            NSLog(@"the same");
        } else {
            NSLog(@"More than");
        }
        
        // strstr
        NSString * file = @"prepage.jpg";
        
        if ([file hasSuffix: @".jpg"]) {
            NSLog(@"it is a picture");
        }
        
        if ([file hasPrefix:@"pre"]) {
            NSLog(@"it is a pre");
        }
        
//        NSRange rang = [str2 rangeOfString:@"hello"];
        
        str2 = @"demo";
        NSLog(@"%@", str2);
        
        // 可变NSString
        NSMutableString * friends = [NSMutableString stringWithCapacity:50 ];
        [friends appendFormat:@"Jack Messi Lucy"];
        NSLog(@"%@", friends);
        [friends deleteCharactersInRange:[friends rangeOfString: @"Jack"]];
        NSLog(@"%@", friends);
        
        // NSArray
        
        NSArray * array = @[@"one", @"two", @"three"];
        NSLog(@"array length is %lu\n, %@", [array count], array[1]);
    
        // NSMutableArray
        
        NSMutableArray * arr2 = [NSMutableArray arrayWithCapacity:12];
        arr2[0] = @"one";
        arr2[1] = @"two";
        NSLog(@"%@", arr2[1]);
        
        [arr2 removeObjectAtIndex:1];
        NSLog(@"%@", arr2[0]);
        
        // traverse
        
        // NSEnumerator * enumer = [array objectEnumerator];
        
        
        for (NSString * str in array) {
            NSLog(@"%@", str);
        }
        
        // Dictonary
        NSDictionary * dict = @ {
            @"name": @"jack",
        };
        
        NSLog(@"%@", dict[@"name"]);
        
        NSMutableDictionary * dict2 = [NSMutableDictionary dictionaryWithCapacity:10];
        
        [dict2 setObject: @"Messi" forKey:@"name"];
        
        NSLog(@"%@" ,dict2[@"name"]);
        
        // oc and c data transform
        
        Book b = {12.12};
        Book b2 = {};
        
        NSValue * bvalue = [NSValue valueWithBytes:&b objCType:@encode(Book)];
        
        [bvalue getValue: &b2];
        printf("%.2f\n", b2.price);
        
        
        // ram management
        RetainTracker * track = [RetainTracker new];
        
        [track retain];
        NSLog(@"%lu", [track retainCount]);
        
        [track release];
        NSLog(@"%lu", [track retainCount]);
        
        [track release];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
