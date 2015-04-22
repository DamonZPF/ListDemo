//
//  GroupModel.h
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger online;

@property (nonatomic, assign) BOOL opened;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)groupWihtDict:(NSDictionary*)dict;
@end
