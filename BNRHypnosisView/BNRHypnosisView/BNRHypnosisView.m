//
//  BNRHypnosisView.m
//  BNRHypnosisView
//
//  Created by xiaobo on 2018/6/5.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRHypnosisView.h"
@interface BNRHypnosisView ()
@property(strong, nonatomic) UIColor * circleColor;
@end

@implementation BNRHypnosisView

-(void) drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    // 表示点结构
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width)/2;
    center.y = (bounds.origin.y + bounds.size.height)/2;
    // CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    
    //float radius = MIN(bounds.size.width, bounds.size.height)/2;
    
    float maxRadius = hypotf(bounds.size.width, bounds.size.height)/2.0;

    UIBezierPath * path = [UIBezierPath new];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        path.lineWidth = 10;
//        [[UIColor lightGrayColor] setStroke];
        [self.circleColor setStroke];
        [path stroke];
        
    }
    
    // shadow
    /*
    UIImage * logoImage = [UIImage imageNamed:@"logo.png"];
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 10), 1);
    [logoImage drawInRect:rect];
    CGContextRestoreGState(currentContext);
     */
    
    // 渐变
    /*
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
     */

    
    // Core Graphic
    // 获取绘图上下文
    /*
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGPoint a = {
        0,
        0,
    };
    
    CGPoint b = {
        bounds.size.width,
        bounds.size.height,
    };
    
    CGContextSetRGBStrokeColor(currentContext, 1, 0, 0, 1);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, a.x, a.y);
    CGPathMoveToPoint(path, NULL, b.x, b.y);
    CGContextAddPath(currentContext, path);
    
    CGContextStrokePath(currentContext);
    CGPathRelease(path);
     */
    
    
}

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    self.circleColor = [UIColor lightGrayColor];
    return self;
}

-(void) setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    // 通知试图重绘
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    float red = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;
    
    UIColor * randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    [self setCircleColor:randomColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
