//
//  XYZTodoItem.h
//  todoList
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZTodoItem : NSObject
@property(copy) NSString * itemName;
@property(assign) BOOL completed;
@property(readonly) NSDate * creationDate;
@end
