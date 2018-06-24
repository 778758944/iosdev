//
//  BNRQuizViewController.h
//  Quiz
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRQuizViewController : UIViewController
@property(nonatomic, copy) NSString * questionText;
@property(nonatomic, copy) NSString * anwserText;

-(void) initQ: (NSString *) questionText and: (NSString *) anwserText;
@end
