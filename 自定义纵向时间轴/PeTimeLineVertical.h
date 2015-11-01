//
//  PeTimeLineVertical.h
//  自定义纵向时间轴
//
//  Created by peter　 on 15/11/1.
//  Copyright © 2015年 zgjxpxpyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeTimeLineModel.h"
@interface PeTimeLineVertical : UITableViewCell

@property(strong,nonatomic)     PeTimeLineModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
