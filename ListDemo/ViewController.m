//
//  ViewController.m
//  ListDemo
//
//  Created by Duomai on 15/4/22.
//  Copyright (c) 2015年 Duomai. All rights reserved.
//

#import "ViewController.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "HeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,HeaderViewDelegate>
@property(nonatomic,strong)NSMutableArray * group;
@end

@implementation ViewController

-(NSMutableArray*)group{
    if (_group == nil) {
        _group = [NSMutableArray array];
    }
    
    return _group;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self loadData];
  
}


-(void)loadData{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    NSArray * group = [[NSArray alloc] initWithContentsOfFile:filePath];
   
    for (NSDictionary * dic in group) {
        GroupModel * model  = [GroupModel groupWihtDict:dic];
        [self.group addObject:model];
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.group.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GroupModel * model = self.group[section];
    return model.opened ? model.friends.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId  = @"cellid";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    GroupModel * model = self.group[indexPath.section];
    FriendModel * friendModel = model.friends[indexPath.row];
    cell.textLabel.text = friendModel.name;
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView * headView = [HeaderView headerViewWithTableView:tableView];
    headView.delegate = self;
    headView.groupModel= self.group[section];
    return headView;

}

-(void)clickHeaderView{
    [self.tableView reloadData];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 44;
}

@end
