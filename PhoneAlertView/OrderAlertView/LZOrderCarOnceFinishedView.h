//
//  LZOrderCarOnceFinishedView.h
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZOrderCarOnceFinishedView : UIView


//车牌号
@property(nonatomic,copy)NSString * carNumberOrder;

//驾驶员
@property(nonatomic,copy)NSString * driverName;

//车辆累计方量数
@property(nonatomic,copy)NSString * totalFls;
//车辆累计运距数
@property(nonatomic,copy)NSString * totalYjs;

@end
