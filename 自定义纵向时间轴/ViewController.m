//
//  ViewController.m
//  自定义纵向时间轴
//
//  Created by peter　 on 15/11/1.
//  Copyright © 2015年 zgjxpxpyx. All rights reserved.
//

#import "ViewController.h"
#import "PeTimeLineVertical.h"
#import "PeTimeLineModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *view =   [[UITableView alloc]initWithFrame:CGRectMake(50, 100, 320, 500)];
    view.delegate = self;
    view.dataSource = self;
    view.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获得cell
    PeTimeLineVertical *cell = [PeTimeLineVertical cellWithTableView:tableView];
    PeTimeLineModel *model = [[PeTimeLineModel alloc]init];
    model.middleImage = @"hb_50";
    model.cellText = @"网上看工地报名";
    model.btnImage = @"get_yzm_non";
    model.detailText = @"芙蓉区五一大道韶山北路1244";
    model.littleImage = @"process_position_img";
    
    cell.model  = model;
    // 给cell传递模型数据
 
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 100;
}

@end
