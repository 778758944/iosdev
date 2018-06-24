//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()
@property(nonatomic, weak) IBOutlet UILabel * question;
@property(nonatomic, weak) IBOutlet UILabel * anwser;
@property (nonatomic) int currentQuestionIndex;
@end

@implementation BNRQuizViewController

@synthesize questionText;
@synthesize anwserText;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.question.text = questionText;
//    self.tabBarItem.title = @"question";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) showAnwser: (id) sender {
    self.anwser.text = self.anwserText;
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.tabBarItem.title = @"Q";
    return self;
}

-(void) initQ:(NSString *)qt and:(NSString *)at
{
    questionText = qt;
    anwserText = at;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
