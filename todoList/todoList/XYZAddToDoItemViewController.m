//
//  XYZAddToDoItemViewController.m
//  todoList
//
//  Created by xiaobo on 2018/6/4.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "XYZAddToDoItemViewController.h"

@implementation XYZAddToDoItemViewController
-(void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"de");
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, CGRectGetWidth(self.view.bounds) - 2*20, 30)];
    
    textField.placeholder = @"New to-do item";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:textField];
}
@end
