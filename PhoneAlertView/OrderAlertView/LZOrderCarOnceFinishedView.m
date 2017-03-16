//
//  LZOrderCarOnceFinishedView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZOrderCarOnceFinishedView.h"
#import "LZOrderAlertDefine.h"



@interface LZOrderCarOnceFinishedView()

//车牌号
@property(nonatomic,strong)UILabel * carNumberLabel , * driverLabel, * flLabel ,  * yjLabel, * tsLabel;


@end


@implementation LZOrderCarOnceFinishedView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setCarNumberOrder:(NSString *)carNumberOrder
{
    if (carNumberOrder) {
        self.carNumberLabel.text = [NSString stringWithFormat:@"车牌号:%@",carNumberOrder];
        [self.carNumberLabel setAttributedText:[ChangeColor changeLabelWithText:self.carNumberLabel.text andChangeText:@"车牌号:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
}

- (void)setDriverName:(NSString *)driverName
{
    
    if (driverName) {
        self.driverLabel.text =  [NSString stringWithFormat:@"驾驶员:%@",driverName];
    }
}

- (void)setTotalFls:(NSString *)totalFls
{
    if (totalFls) {
        
        self.flLabel.text = [NSString stringWithFormat:@"方    量:%@方",totalFls];
        [ self.flLabel setAttributedText:[ChangeColor changeLabelWithText: self.flLabel.text andChangeText:@"方    量:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
}

- (void)setTotalYjs:(NSString *)totalYjs
{
    if (totalYjs) {
        
        self.yjLabel.text = [NSString stringWithFormat:@"运    距:%@公里",totalYjs];
        [ self.yjLabel setAttributedText:[ChangeColor changeLabelWithText:self.yjLabel.text andChangeText:@"运    距:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
    
}


- (UILabel *)carNumberLabel
{
    if (!_carNumberLabel) {
        _carNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin, self.bounds.size.width-leftMargin*2, 20)];
        _carNumberLabel.text = @"车牌号:渝0000";
        _carNumberLabel.font = TITLEFONT;
        _carNumberLabel.textColor = ORANGECOLOR;
        
        [_carNumberLabel setAttributedText:[ChangeColor changeLabelWithText:_carNumberLabel.text andChangeText:@"车牌号:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
        
    }
    return _carNumberLabel;
}

- (UILabel *)driverLabel
{
    if (!_driverLabel) {
        _driverLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.carNumberLabel.frame), self.bounds.size.width-leftMargin*2, 20)];
        _driverLabel.text = @"驾驶员:未知";
        _driverLabel.font = TITLEFONT;
        _driverLabel.textColor = BLACKCOLOR;
        
    }
    return _driverLabel;
}

- (UILabel *)flLabel
{
    if (!_flLabel) {
        _flLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.driverLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
        _flLabel.text = @"方    量:0方";
        _flLabel.font = TITLEFONT;
        _flLabel.textColor = ORANGECOLOR;
        [_flLabel setAttributedText:[ChangeColor changeLabelWithText:_flLabel.text andChangeText:@"方    量:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
        
    }
    return _flLabel;
}

- (UILabel *)yjLabel
{
    if (!_yjLabel) {
        _yjLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.flLabel.frame), topMargin+CGRectGetMaxY(self.driverLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
        _yjLabel.text = @"运    距:0公里";
        _yjLabel.font = TITLEFONT;
        _yjLabel.textColor = ORANGECOLOR;
        [_yjLabel setAttributedText:[ChangeColor changeLabelWithText:_yjLabel.text andChangeText:@"运    距:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
        
    }
    return _yjLabel;
}

- (UILabel *)tsLabel
{
    if (!_tsLabel) {
        _tsLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.flLabel.frame), self.bounds.size.width-leftMargin*2, 20)];
        _tsLabel.text = @"是否确认该车辆已完成此趟订单？";
        _tsLabel.font = TITLEFONT;
        _tsLabel.textColor = BLACKCOLOR;
        
    }
    return _tsLabel;
}
- (void)setUp{
    
    [self addSubview:self.carNumberLabel];
    [self addSubview:self.driverLabel];
    [self addSubview:self.flLabel];
    [self addSubview:self.yjLabel];
    [self addSubview:self.tsLabel];
    
    
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
