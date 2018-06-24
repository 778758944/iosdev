//
//  tire.h
//  learnoc
//
//  Created by xiaobo on 2018/6/2.
//  Copyright © 2018年 xiaobo. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef tire_h
#define tire_h
@interface Tire : NSObject<NSCopying> {
    float pressure;
    float treadDepth;
}
@property float pressure;
@property float treadDepth;
-(NSString *) description;
-(id) initWithPressure: (float) pressure treadDepth: (float) treadDepth;
@end

#endif /* tire_h */
