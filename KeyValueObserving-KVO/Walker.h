//
//  Walker.h
//  KeyValueObserving-KVO
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Walker : NSObject

@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *name;

- (id)initWithName:(NSString *)name age:(NSString *)age;
@end
