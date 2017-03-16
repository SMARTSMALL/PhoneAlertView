
//
//  LZOrderCarFinishedAllView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZOrderCarFinishedAllView.h"
#import "LZOrderAlertDefine.h"



@interface LZOrderCarFinishedAllView()


@property(nonatomic,strong)UIImageView * showAddressImage;

@property(nonatomic,strong)UILabel * carNumberLabel ,* numberLabel , * numberTsLabel, * flLabel ,  * yjLabel, * tsLabel;


@end


@implementation LZOrderCarFinishedAllView


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
        self.carNumberLabel.text = carNumberOrder;
    }
}

- (void)setCarNumberTotal:(NSString *)carNumberTotal
{
    if (carNumberTotal) {
        
        self.numberLabel.text = carNumberTotal;
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject: self.numberLabel.font forKey:NSFontAttributeName];
        CGSize size = [carNumberTotal boundingRectWithSize:CGSizeMake(100, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        
        [self.numberLabel setFrame:CGRectMake(CGRectGetMinX(self.yjLabel.frame), topMargin+8,size.width+10,20)];
        [self.numberTsLabel setFrame:CGRectMake(CGRectGetMaxX(self.numberLabel.frame)+10, topMargin+8, 40, 20)];
        
        
    }   
}

- (void)setTotalFls:(NSString *)totalFls
{
    if (totalFls) {
        
        self.flLabel.text = [NSString stringWithFormat:@"累计方量:%@方",totalFls];
        [ self.flLabel setAttributedText:[ChangeColor changeLabelWithText: self.flLabel.text andChangeText:@"累计方量:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
}

- (void)setTotalYjs:(NSString *)totalYjs
{
    if (totalYjs) {
        
        self.yjLabel.text = [NSString stringWithFormat:@"累计运距:%@公里",totalYjs];
        [ self.yjLabel setAttributedText:[ChangeColor changeLabelWithText:self.yjLabel.text andChangeText:@"累计运距:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
    
}

- (UILabel *)carNumberLabel
{
    if (!_carNumberLabel) {
        _carNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+8, 100, 20)];
        _carNumberLabel.text = @"渝A0000";
        _carNumberLabel.font = TITLEFONT;
        _carNumberLabel.textColor = BLACKCOLOR;
        _carNumberLabel.textAlignment = NSTextAlignmentCenter;
        
        
    }
    return _carNumberLabel;
}
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.yjLabel.frame), topMargin+8, 40, 20)];
        _numberLabel.text = @"0";
        _numberLabel.font = TITLEFONT;
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.textColor = [UIColor colorWithHexString:@"#e7e7e7"];
    }
    return _numberLabel;
}

- (UILabel *)numberTsLabel
{
    if (!_numberTsLabel) {
        _numberTsLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.numberLabel.frame)+10, topMargin+8, 40, 20)];
        _numberTsLabel.text = @"趟";
        _numberTsLabel.font = TITLEFONT;
        _numberTsLabel.textColor = [UIColor colorWithHexString:@"#e7e7e7"];
        
        
    }
    return _numberTsLabel;
}



- (UILabel *)flLabel
{
    if (!_flLabel) {
        _flLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.carNumberLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
        _flLabel.text = @"累计方量:0方";
        _flLabel.font = TITLEFONT;
        _flLabel.textColor = ORANGECOLOR;
        [_flLabel setAttributedText:[ChangeColor changeLabelWithText:_flLabel.text andChangeText:@"累计方量:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
        
    }
    return _flLabel;
}

- (UILabel *)yjLabel
{
    if (!_yjLabel) {
        _yjLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.flLabel.frame), topMargin+CGRectGetMaxY(self.carNumberLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
        _yjLabel.text = @"累计运距:0公里";
        _yjLabel.font = TITLEFONT;
        _yjLabel.textColor = ORANGECOLOR;
        [_yjLabel setAttributedText:[ChangeColor changeLabelWithText:_yjLabel.text andChangeText:@"累计运距:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
        
    }
    return _yjLabel;
}

- (UILabel *)tsLabel
{
    if (!_tsLabel) {
        _tsLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.flLabel.frame), self.bounds.size.width-leftMargin*2, 20)];
        _tsLabel.text = @"是否确认该车辆已完成此订单所有任务？";
        _tsLabel.font = TITLEFONT;
        _tsLabel.textColor = BLACKCOLOR;
        
    }
    return _tsLabel;
}
- (void)setUp{
    
    
    [self addSubview:self.carNumberLabel];
    [self addSubview:self.flLabel];
    [self addSubview:self.yjLabel];
    [self addSubview:self.tsLabel];
    
    [self addSubview:self.numberLabel];
    [self addSubview:self.numberTsLabel];
    
    
    self.carNumberLabel.layer.borderColor =  BLACKCOLOR.CGColor;;
    self.carNumberLabel.layer.borderWidth = 1.0f;
    self.carNumberLabel.layer.cornerRadius = 5.0;
    [self.carNumberLabel.layer masksToBounds];
    
    
    self.numberLabel.layer.borderColor =  [UIColor colorWithHexString:@"#e7e7e7"].CGColor;;
    self.numberLabel.layer.borderWidth = 1.0f;
    self.numberLabel.layer.cornerRadius = 5.0;
    [self.numberLabel.layer masksToBounds];
    

    
    
}
@end
