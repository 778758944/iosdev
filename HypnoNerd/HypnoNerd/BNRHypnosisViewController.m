//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by xiaobo on 2018/6/6.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController() <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController
-(void) loadView {
    BNRHypnosisView * backgroundView = [BNRHypnosisView new];
    // self.view = backgroundView;
//    [backgroundView setCircleColor:[UIColor redColor]];
    /*
    if (self.view == backgroundView) {
        NSLog(@"yes they are the same");
    }
    NSArray * colors = @[@"red", @"green", @"blue"];
    CGRect pos = {
        {
            100,
            100
        },
        {
            200,
            50,
        }
    };
    UISegmentedControl * seg = [[UISegmentedControl alloc] initWithFrame: pos];
    seg = [seg initWithItems:colors];
    [seg setSelectedSegmentIndex:0];
    [seg addTarget:self action:@selector(onSegChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: seg];
     */
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField * textField = [[UITextField alloc] initWithFrame: textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    [textField setDelegate:self];
    [backgroundView addSubview: textField];
    self.view = backgroundView;
    
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage * i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    
    return self;
}

-(void) viewDidLoad {
    NSLog(@"BNRHypnosisViewController loaded");
}

-(void) viewDidDisappear:(BOOL)animated {
    NSLog(@"disappear");
}

-(void) onSegChange: (UIControlEvents) e {
    NSLog(@"seg changed %@", self.view);
}

-(BOOL)textFieldShouldReturn: (UITextField *) textField {
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

-(void) drawHypnoticMessage: (NSString *) message {
    for (int i = 0; i < 20; i++) {
        UILabel * messageLabel = [UILabel new];
        [messageLabel setBackgroundColor:[UIColor clearColor]];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        
        int width = (int) (self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        int height = (int) (self.view.bounds.size.height - messageLabel.bounds.size.height);
        
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        [self.view addSubview: messageLabel];
    }
}

@end
