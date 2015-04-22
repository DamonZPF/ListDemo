//
//  FriendModel.h
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter = isVip) BOOL vip;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)friendWithDict:(NSDictionary*)dict;

@end
