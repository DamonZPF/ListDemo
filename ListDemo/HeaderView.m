//
//  HeaderView.m
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()
{
    UIButton *_bgButton;
    UIButton * clickedButton;
}
@end

@implementation HeaderView



+(instancetype)headerViewWithTableView:(UITableView*)tabelView{

    static NSString * headerId = @"headerId";
    HeaderView * headerView = [tabelView dequeueReusableHeaderFooterViewWithIdentifier:headerId];
    if (headerView == nil) {
        
        headerView = [[HeaderView alloc]initWithReuseIdentifier:headerId];
    }
    
    return headerView;
    
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bgButton.imageView.contentMode = UIViewContentModeCenter;
        bgButton.imageView.clipsToBounds = NO;
        bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [bgButton addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgButton];
        _bgButton = bgButton;
        

    }
    return self;
}

-(void)headBtnClick:(UIButton*)btn{
    self.groupModel.opened = !self.groupModel.opened;
    if ([self.delegate respondsToSelector:@selector(clickHeaderView)]) {
        [self.delegate clickHeaderView];
    }

}

-(void)setGroupModel:(GroupModel *)groupModel{
    _groupModel = groupModel;
    [_bgButton setTitle:groupModel.name forState:UIControlStateNormal];
    _bgButton.imageView.transform = self.groupModel.opened ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    _bgButton.frame = self.bounds;

}

@end
