//
//  Walker.m
//  KeyValueObserving-KVO
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "Walker.h"

@implementation Walker

- (id)initWithName:(NSString *)name age:(NSString *)age
{
    self=[super init];
    if (self) {
        _name=name;
        _age=age;
    }
    
    return self;
}

@end
