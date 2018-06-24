//
//  BNRImageStore.h
//  Homepwner
//
//  Created by xiaobo on 2018/6/23.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject
+(instancetype) sharedStore;
-(void) setImage: (UIImage *) image forKey: (NSString *) key;
-(UIImage *) imageForKey: (NSString *) key;
-(void) deleteImageForKey: (NSString *) key;
@end
