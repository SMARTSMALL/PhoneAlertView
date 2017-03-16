
//
//  ChangeColor.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "ChangeColor.h"

@implementation ChangeColor


/**
 *  设置不同颜色不同字体
 *
 *  @param needText     label.title
 *  @param changetext   需要改变的text
 *  @param color        changeColor
 *  @param font         字体大小
 *
 */
+ (NSMutableAttributedString *)changeLabelWithText:(NSString*)needText andChangeText:(NSString *)changetext andTextColor:(UIColor *)color andFont:(UIFont *)font{
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    NSRange  range = [needText rangeOfString:changetext];
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attrString addAttribute:NSFontAttributeName value:font range:range];
    
    return attrString;
}

@end
