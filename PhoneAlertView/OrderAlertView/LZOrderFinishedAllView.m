

//
//  LZOrderFinishedAllView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZOrderFinishedAllView.h"
#import "LZOrderAlertDefine.h"



@interface LZOrderFinishedAllView()


@property(nonatomic,strong)UIImageView * showAddressImage;

@property(nonatomic,strong)UILabel * addressLabel , * flLabel ,  * yjLabel, * tsLabel;


@end


@implementation LZOrderFinishedAllView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setAddressStr:(NSString *)addressStr
{
    if (addressStr) {
        self.addressLabel.text = addressStr;
    }
}

- (void)setTotalFls:(NSString *)totalFls
{
    if (totalFls) {
        
        self.flLabel.text = [NSString stringWithFormat:@"累计方量:%@方",totalFls];
        [ self.flLabel setAttributedText:[ChangeColor changeLabelWithText:  self.flLabel.text andChangeText:@"累计方量:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }
}

- (void)setTotalYjs:(NSString *)totalYjs
{
    
    if (totalYjs) {
                
        if ([totalYjs isEqual:[NSNull null]] || [totalYjs isEqualToString:@""] || [totalYjs isEqualToString:@"0"] || totalYjs == nil) {
            
            self.yjLabel.hidden = YES;
        }else{
            self.yjLabel.hidden = NO;
        }
    
        self.yjLabel.text = [NSString stringWithFormat:@"累计运距:%@公里",totalYjs];
        [ self.yjLabel setAttributedText:[ChangeColor changeLabelWithText:self.yjLabel.text andChangeText:@"累计运距:" andTextColor:BLACKCOLOR andFont:TITLEFONT]];
    }else{
    
     self.yjLabel.hidden = YES;
    }
    
}

- (UIImageView *)showAddressImage
{
    if (!_showAddressImage) {
        _showAddressImage = [[UIImageView alloc]init];
        _showAddressImage.image = [UIImage imageNamed:@"location"];
        _showAddressImage.frame = CGRectMake(leftMargin, topMargin+8, _showAddressImage.image.size.width,  _showAddressImage.image.size.height);
        
    }
    return _showAddressImage;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.showAddressImage.frame), CGRectGetMidY(self.showAddressImage.frame)-10, self.bounds.size.width-leftMargin*2, 20)];
        _addressLabel.text = @"";
        _addressLabel.font = TITLEFONT;
        _addressLabel.textColor = BLACKCOLOR;
    
        
    }
    return _addressLabel;
}



- (UILabel *)flLabel
{
    if (!_flLabel) {
        _flLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, topMargin+CGRectGetMaxY(self.addressLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
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
        _yjLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.flLabel.frame), topMargin+CGRectGetMaxY(self.addressLabel.frame), (self.bounds.size.width-leftMargin*2)/2.0, 20)];
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
        _tsLabel.text = @"是否确认该订单已全部完成？";
        _tsLabel.font = TITLEFONT;
        _tsLabel.textColor = BLACKCOLOR;
        
    }
    return _tsLabel;
}
- (void)setUp{
    
    [self addSubview:self.showAddressImage];
    [self addSubview:self.addressLabel];
    [self addSubview:self.flLabel];
    [self addSubview:self.yjLabel];
    [self addSubview:self.tsLabel];
    
    
}
@end
