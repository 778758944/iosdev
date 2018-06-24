//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by xiaobo on 2018/6/6.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()
@property(nonatomic, weak) IBOutlet UIDatePicker * datePicker;
@property(nonatomic, weak) IBOutlet UIButton * button;
@end

@implementation BNRReminderViewController
-(IBAction)addReminder:(id)sender {
    NSDate * date = self.datePicker.date;
    NSLog(@"Setting a remind for %@", date);
    // notofication to do
    
}
-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        UIImage * i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) viewDidLoad {
    // 渲染完成时永远只执行一次
    NSLog(@"BNRReminderViewController loaded");
}

-(void) viewWillAppear:(BOOL)animated
{
    // 试图被展现执行
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
@end
