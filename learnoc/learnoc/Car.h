//
//  Car.h
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#ifndef Car_h
#define Car_h
#import "tire.h"
#import "engine.h"


@interface Car : NSObject<NSCopying> {
    NSString *name;
    float price;
    Engine *engine;
    Tire *tires[4];
}
@property(copy) NSString * name;
@property(readonly) float price;
-(void) print;
-(Engine *) engine;
-(void) setEngine: (Engine *) engine;

@end


#endif /* Car_h */
