//
//  LZOrderAlertView.h
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//


/**
 *
 *
 *    是否确认该车辆已完成此趟订单？
      是否确认该车辆已完成此订单所有任务？
      是否确认该订单已全部完成？
      您当前还有正在执行中的订单，确认解绑将不再继续执行此订单？
 */




#import <UIKit/UIKit.h>


@interface LZOrderAlertView : UIView


/**
 *   车辆单趟完成
 *
 *  @param carNumber    车牌号
 *  @param driverName   驾驶员名字
 *  @param totalFls     方量
 *  @param totalYjs     运距
 */

- (void)showCarOnceFinishWithCarNumber:(NSString *)carNumber
                        withDriverName:(NSString *)driverName
                          withTotalFls:(NSString *)totalFls
                          withTotalYjs:(NSString *)totalYjs;

/**
 *   车辆订单所有完成
 *
 *  @param carNumber        车牌号
 *  @param carNumberTotal   累计趟数
 *  @param totalFls         方量
 *  @param totalYjs         运距
 */

- (void)showCarFinishWithCarNumber:(NSString *)carNumber
                        withCarNumberTotal:(NSString *)carNumberTotal
                          withTotalFls:(NSString *)totalFls
                          withTotalYjs:(NSString *)totalYjs;

/**
 *   订单所有完成
 *
 *  @param addressStr       地址
 *  @param totalFls         累计方量
 *  @param totalYjs         累计运距
 */

- (void)showOrderFinishWithAddressStr:(NSString *)addressStr
                          withTotalFls:(NSString *)totalFls
                          withTotalYjs:(NSString *)totalYjs;

//取消正在执行的订单
- (void)showOrderRunAlertView;

//点击取消回掉
@property(nonatomic,copy)void (^ClickCancleHandle)();

//点击确认回掉
@property(nonatomic,copy)void (^ClickSureHandle)();




@end
