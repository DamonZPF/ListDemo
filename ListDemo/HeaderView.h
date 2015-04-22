//
//  HeaderView.h
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"
@class HeaderView;
@protocol HeaderViewDelegate <NSObject>

-(void)clickHeaderView;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong)GroupModel * groupModel;
@property(nonatomic,weak)id <HeaderViewDelegate> delegate;
+(instancetype)headerViewWithTableView:(UITableView*)tabelView;

@end
