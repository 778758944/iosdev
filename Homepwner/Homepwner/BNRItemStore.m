//
//  BNRItemStore.m
//  Homepwner
//
//  Created by xiaobo on 2018/6/19.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore()
@property (nonatomic) NSMutableArray * privateItems;
@end

@implementation BNRItemStore
+(instancetype) sharedStore
{
    static BNRItemStore * sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [NSMutableArray new];
    }
    return self;
}

-(NSArray *) allItems {
    return [_privateItems copy];
}

-(BNRItem *) createItem {
    BNRItem * item = [BNRItem randomItem];
    [_privateItems addObject:item];
    return item;
}

-(void) removeItem:(BNRItem *)item
{
    [[BNRImageStore sharedStore] deleteImageForKey:item.itemkey];
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    BNRItem * item = _privateItems[fromIndex];
    [_privateItems removeObjectAtIndex:fromIndex];
    [_privateItems insertObject:item atIndex:toIndex];
}

@end
