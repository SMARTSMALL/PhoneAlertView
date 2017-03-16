//
//  LZOrderRunAlertView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/16.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZOrderRunAlertView.h"
#import "LZOrderAlertDefine.h"



@interface LZOrderRunAlertView()

@property(nonatomic,strong)UILabel * tsLabel;


@end


@implementation LZOrderRunAlertView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        [self setUp];
    }
    return self;
}



- (UILabel *)tsLabel
{
    if (!_tsLabel) {
        _tsLabel = [[UILabel alloc]init];
        _tsLabel.text = @"您当前还有正在执行中的订单，确认解绑将不再继续执行此订单？";
        _tsLabel.font = TITLEFONT;
        _tsLabel.textColor = BLACKCOLOR;
        _tsLabel.numberOfLines = 0;
        _tsLabel.lineBreakMode = NSLineBreakByCharWrapping;
        
  
        CGFloat labelTextHeight = [self getSpaceLabelHeight:_tsLabel.text withFont:TITLEFONT withWidth:(self.bounds.size.width-20) withLineSpace:6.0f];
        
        _tsLabel.frame = CGRectMake(10, (self.bounds.size.height-labelTextHeight)/2.0, self.bounds.size.width-20, labelTextHeight);
    }
    return _tsLabel;
}


//计算UILabel的高度(带有行间距的情况)
- (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withLineSpace:(CGFloat)lineSpace{
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:lineSpace];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [str length])];
    [self.tsLabel setAttributedText:attributedString1];
    
    CGSize size =  [str sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
    
    return size.height+lineSpace;
}



- (void)setUp{
    
    
    
    [self addSubview:self.tsLabel];
    
    
    
}

@end
