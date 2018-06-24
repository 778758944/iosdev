//
//  ViewController.m
//  todoList
//
//  Created by xiaobo on 2018/6/1.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view Did Load");
    UILabel * label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"Hello, world";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
