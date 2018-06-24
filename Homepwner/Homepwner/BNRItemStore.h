//
//  BNRItemStore.h
//  Homepwner
//
//  Created by xiaobo on 2018/6/19.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
-(void) removeItem:(BNRItem *) item;
@property(nonatomic, readonly) NSArray * allItems;
+(instancetype) sharedStore;
-(BNRItem *)createItem;
-(void) moveItemAtIndex: (NSUInteger)fromIndex
                toIndex: (NSUInteger)toIndex;

@end
