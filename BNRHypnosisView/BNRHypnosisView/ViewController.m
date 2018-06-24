//
//  ViewController.m
//  BNRHypnosisView
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    // UISCROLLVIEW
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    // PAGE
    scrollView.pagingEnabled = YES;
    [self.view addSubview: scrollView];
    
    
    BNRHypnosisView * hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    
    screenRect.origin.x = screenRect.size.width;
    
    BNRHypnosisView * hyponsisView2 = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    
    
    
    scrollView.contentSize = bigRect.size;
    [scrollView addSubview:hypnosisView];
    [scrollView addSubview:hyponsisView2];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
