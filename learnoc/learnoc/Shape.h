//
//  Shape.h
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#ifndef Shape_h
#define Shape_h
typedef enum {
    kRedColor,
    kGreenColor,
    kBlueColor
} ShapeColor;

typedef struct {
    int x, y, width, height;
} ShapeRect;

@interface Shape : NSObject {
    ShapeColor FillColor;
    ShapeRect bounds;
}

-(void) setFillColor: (ShapeColor) FillColor;
-(void) setBounds: (ShapeRect) bounds;
-(void) draw;
@end

#endif /* Shape_h */
