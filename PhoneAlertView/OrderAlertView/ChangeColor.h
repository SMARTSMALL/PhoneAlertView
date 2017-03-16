//
//  ChangeColor.h
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChangeColor : NSObject

/**
 *  设置不同颜色不同字体
 *
 *  @param needText     label.title
 *  @param changetext   需要改变的text
 *  @param color        changeColor
 *  @param font         字体大小
 *
 */
+ (NSMutableAttributedString *)changeLabelWithText:(NSString*)needText andChangeText:(NSString *)changetext andTextColor:(UIColor *)color andFont:(UIFont *)font;
@end
