//
//  Person.h
//  learnoc
//
//  Created by xiaobo on 2018/6/1.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#ifndef Person_h
#define Person_h

@interface Person : NSObject {
    @public
    NSString *name;
    
    @private
    int age;
}

@property(copy) NSString *name;
@property(readonly) int age;

-(id)initWithAge: (int)initAge;
-(void) introduceMe;
@end


#endif /* Person_h */
