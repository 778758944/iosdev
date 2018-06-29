//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by xiaobo on 2018/6/25.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView() <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer * moveRecognizer;
@property (nonatomic, strong) NSMutableArray<BNRLine *> * finishedLine;
@property (nonatomic, strong) NSMutableDictionary<NSValue *, BNRLine *> * linesInProgress;
@property (nonatomic, weak) BNRLine * selectedLine;
@end

@implementation BNRDrawView
-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.finishedLine = [NSMutableArray new];
        self.backgroundColor = [UIColor grayColor];
        self.linesInProgress = [NSMutableDictionary new];
        self.multipleTouchEnabled = YES;
        UITapGestureRecognizer * doubleTapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        
        doubleTapRecognize.numberOfTapsRequired = 2;
        doubleTapRecognize.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognize];
        
        // 单击
        UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognize];
        [self addGestureRecognizer: tapRecognizer];
        
        // long press
        UILongPressGestureRecognizer * pressRecognize = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
        [self addGestureRecognizer:pressRecognize];
        
        // pan
        self.moveRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
        self.moveRecognizer.delegate = self;
        // 该手势被识别 其他时间无效
        self.moveRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:self.moveRecognizer];
        
    }
    
    return self;
}

-(void) strokeLine: (BNRLine *) line
{
    UIBezierPath * bp = [UIBezierPath bezierPath
                         ];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint: line.end];
    [bp stroke];
}

-(void) drawRect: (CGRect) rect
{
    [[UIColor blackColor] set];
    for (BNRLine * line in self.finishedLine) {
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    
    for (NSValue * key in self.linesInProgress) {
        [self strokeLine: self.linesInProgress[key]];
    }
    
    if (self.selectedLine) {
        [[UIColor greenColor] set];
        [self strokeLine: _selectedLine];
    }
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch * t in touches) {
        CGPoint location = [t locationInView:self];
        BNRLine * line = [BNRLine new];
        line.begin = location;
        line.end = location;
        NSValue * key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch * t in touches) {
        CGPoint location = [t locationInView:self];
        NSValue * key = [NSValue valueWithNonretainedObject:t];
        BNRLine * line = self.linesInProgress[key];
        line.begin = location;
        // transform address tp NSValue;
        //NSValue * key = [NSValue valueWithNonretainedObject:t];
        
    }
    // triger rerender
    // call drawRect
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch * t in touches) {
        NSValue * key = [NSValue valueWithNonretainedObject:t];
        BNRLine * line = self.linesInProgress[key];
        [self.finishedLine addObject: line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch * t in touches) {
        NSValue * key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

-(void) doubleTap: (UIGestureRecognizer *) gr
{
    NSLog(@"Recognized Double Tap");
    [self.linesInProgress removeAllObjects];
    [self.finishedLine removeAllObjects];
    [self setNeedsDisplay];
}

-(void) tap: (UIGestureRecognizer *) gr
{
    NSLog(@"Recognized Tap");
    CGPoint pos = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:pos];
    if (self.selectedLine) {
        [self becomeFirstResponder];
        UIMenuController * menu = [UIMenuController sharedMenuController];
        UIMenuItem * deleteItem = [[UIMenuItem alloc] initWithTitle:@"delete" action:@selector(deleteLine:)];
        menu.menuItems = @[deleteItem];
        [menu setTargetRect:CGRectMake(pos.x, pos.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    } else {
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    }
    [self setNeedsDisplay];
}

-(BNRLine *) lineAtPoint: (CGPoint) p
{
    for (BNRLine * l in self.finishedLine) {
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        for (float t = 0.0; t <= 1.0; t += 0.05) {
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
            if (hypot(x-p.x, y-p.y) < 20.0) {
                return l;
            }
        }
    }
    return nil;
}

-(void) deleteLine: (id) sender
{
    NSLog(@"touch");
    [self.finishedLine removeObject:self.selectedLine];
    [self setNeedsDisplay];
}

-(BOOL) canBecomeFirstResponder
{
    return YES;
}

-(void) move: (UIGestureRecognizer *) gr
{
    if (gr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gr locationInView:self];
        self.selectedLine = [self lineAtPoint: point];
        if (self.selectedLine) {
            [self.linesInProgress removeAllObjects];
        }
    } else if (gr.state == UIGestureRecognizerStateEnded) {
        self.selectedLine = nil;
    }
    [self setNeedsDisplay];
}

-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.moveRecognizer) {
        return YES;
    }
    return NO;
}

-(void) moveLine: (UIPanGestureRecognizer *) gr
{
    if (!self.selectedLine) {
        return;
    }
    
    if (gr.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gr translationInView:self];
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        
        begin.x += translation.x;
        begin.y += translation.y;
        
        end.x += translation.x;
        end.y += translation.y;
        
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        [self setNeedsDisplay];
        [gr setTranslation:CGPointZero inView:self];
    }
}
@end






























