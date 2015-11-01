//
//  PeTimeLineVertical.m
//  自定义纵向时间轴
//
//  Created by peter　 on 15/11/1.
//  Copyright © 2015年 zgjxpxpyx. All rights reserved.
//

#import "PeTimeLineVertical.h"
#import "Masonry.h"
#import "PeTimeLineModel.h"
@interface PeTimeLineVertical()
{
    UIView *viewTopLine;
    UIView *endLine;
    UIImageView *middleImage;
    UILabel *cellMainLabel;
    UIButton *clickBtn;
    UIImageView *littleImageView;
    UILabel *cellDetailLabel;

    
}
@end
@implementation PeTimeLineVertical

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"PeTimeLineVertical";
    PeTimeLineVertical *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PeTimeLineVertical alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
   
    }
    return cell;
}










- (void)drawRect:(CGRect)rect
{
  
    int width =  self.frame.size.width;
    int height = self.frame.size.height;
    
    //顶部线条
    viewTopLine = [[UIView alloc]init];
    viewTopLine.backgroundColor = [UIColor redColor];
    
    [self addSubview:viewTopLine];
    [viewTopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, height/3-10));
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(width/15-2);
    }];
    
    //中间图形
    // HB_50
    middleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.model.middleImage]];
    [self addSubview:middleImage];
    [middleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(viewTopLine.mas_bottom).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(width/15*2, height/3));
    }];
    
    //底部线条
    endLine = [[UIView alloc]init];
    endLine.backgroundColor = [UIColor redColor];
    
    [self addSubview:endLine];
    [endLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, height/3-10));
        make.top.equalTo(middleImage.mas_bottom).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(width/15-2);
    }];
    
    //左边的标题
    cellMainLabel = [[UILabel alloc]init];
    cellMainLabel.text=self.model.cellText;
    cellMainLabel.textColor = [UIColor blackColor];
    cellMainLabel.font = [UIFont boldSystemFontOfSize:12];
    cellMainLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:cellMainLabel];
    
    [cellMainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(middleImage.mas_right).with.offset(20);
        make.top.equalTo(middleImage.mas_top);
        make.size.mas_equalTo(CGSizeMake(width/15*10-20, height/3));
    }];
    
    //右边按钮
    clickBtn = [[UIButton alloc]init];
    
    [clickBtn setBackgroundImage:[UIImage imageNamed:self.model.btnImage] forState:UIControlStateNormal];
    
    [clickBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickBtn];
    [clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cellMainLabel.mas_right);
        make.top.equalTo(cellMainLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(width/15*3, height/3));
    }];
    //小图标
    
    littleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.model.littleImage ]];
    [self addSubview:littleImageView];
    [littleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.top.equalTo(cellMainLabel.mas_bottom);
        make.left.equalTo(cellMainLabel.mas_left);
    }
     ];
    
    
    //详细说明
    cellDetailLabel = [[UILabel alloc]init];
    cellDetailLabel.text=self.model.detailText;
    cellDetailLabel.textColor = [UIColor blackColor];
    cellDetailLabel.font = [UIFont boldSystemFontOfSize:8];
    cellDetailLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:cellDetailLabel];
    [cellDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(10);
        make.left.equalTo(littleImageView.mas_right);
        make.right.equalTo(clickBtn.mas_left);
        make.top.equalTo(littleImageView.mas_top);
    }];

}


-(void) btnClick:(UIButton *)btn
{
    NSLog(@"点击按钮");
}

- (void)setSelected:(BOOL)selected
{
    return ;
}
@end
