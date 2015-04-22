//
//  FriendModel.m
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import "FriendModel.h"
@implementation FriendModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype)friendWithDict:(NSDictionary*)dict{
    return [[self alloc] initWithDict:dict];
}

@end
