//
//  GroupModel.m
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"
@implementation GroupModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray * tempArray = [NSMutableArray array];
        for (NSDictionary * dic in _friends) {
            FriendModel * model = [FriendModel friendWithDict:dic];
            [tempArray addObject:model];
        }
        _friends = tempArray;
    }
    return self;
}


+(instancetype)groupWihtDict:(NSDictionary*)dict{
    return [[self alloc] initWithDict:dict];
}

@end
