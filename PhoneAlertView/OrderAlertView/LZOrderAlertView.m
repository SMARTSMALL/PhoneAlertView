

//
//  LZOrderAlertView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZOrderAlertView.h"
#import "LZOrderCarOnceFinishedView.h"
#import "LZOrderFinishedAllView.h"
#import "LZOrderCarFinishedAllView.h"
#import "UIColor+Hex.h"
#import "LZOrderRunAlertView.h"
#define kSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define kISCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//边距
static CGFloat alertLeftMargin = 20.0f;
//按钮高度
static CGFloat alertButtonHeight = 40.0f;

@interface LZOrderAlertView()

/**  容器 **/
@property(nonatomic,strong)UIView * containerView;
/**  背景蒙版 **/
@property(nonatomic,strong)UIView * maskView;
@property(nonatomic,strong)LZOrderCarOnceFinishedView * carOnceFinishView;
//
@property(nonatomic,strong)LZOrderFinishedAllView * finishAllView;
@property(nonatomic,strong)LZOrderCarFinishedAllView*  carFinishAllView;
//取消正在执行的订单
@property(nonatomic,strong)LZOrderRunAlertView * orderRunAlertView;
@end


@implementation LZOrderAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initMaskView];
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self initContainerView];
        
    }
    return self;
}

- (void)initMaskView{
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kISCREEN_HEIGHT)];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.maskView.userInteractionEnabled = YES;
    [ self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)]];
}

- (void)initContainerView{
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH-alertLeftMargin*2, 220)];
    self.containerView .backgroundColor = [UIColor whiteColor];
    

    
}

- (void)isClickBtn:(UIButton *)btn{
    
    
    [self hiddenWithAnimation];
    switch (btn.tag) {
        case 1000:
        {
            
            
            
            if (self.ClickCancleHandle) {
                
                self.ClickCancleHandle();
            }
            
            
        }
            break;
        case 1001:
        {
            if (self.ClickSureHandle) {
                
                self.ClickSureHandle();
            }
            
        }
            break;
        default:
            break;
    }
    
}

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
                          withTotalYjs:(NSString *)totalYjs{

    [self.containerView setFrame:CGRectMake(0, 0, self.containerView.bounds.size.width,140+44)] ;
    
    [self showWithAnimation];
    

    
    if (! self.carOnceFinishView) {
        self.carOnceFinishView = [[LZOrderCarOnceFinishedView alloc]initWithFrame:CGRectMake(0, 0, self.containerView.bounds.size.width, self.containerView.bounds.size.height-alertButtonHeight-1)];
        self.carOnceFinishView.carNumberOrder = carNumber;
        self.carOnceFinishView.driverName = driverName;
        self.carOnceFinishView.totalFls = totalFls;
        self.carOnceFinishView.totalYjs = totalYjs;
        [self.containerView addSubview:self.carOnceFinishView];
    }
}

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
                      withTotalYjs:(NSString *)totalYjs{
  
    [self.containerView setFrame:CGRectMake(0, 0, self.containerView.bounds.size.width,120+44)] ;
    
    [self showWithAnimation];
    
    
    

    if (!self.carFinishAllView) {
        self.carFinishAllView  = [[LZOrderCarFinishedAllView alloc]initWithFrame:CGRectMake(0, 0, self.containerView.bounds.size.width, self.containerView.bounds.size.height-alertButtonHeight-1)];
        self.carFinishAllView.carNumberOrder = carNumber;
        self.carFinishAllView.carNumberTotal = carNumberTotal;
        self.carFinishAllView.totalFls = totalFls;
        self.carFinishAllView.totalYjs = totalYjs;
        [self.containerView addSubview:self.carFinishAllView];
    }
    
}

/**
 *   订单所有完成
 *
 *  @param addressStr       地址
 *  @param totalFls         累计方量
 *  @param totalYjs         累计运距   totalYjs==nil 隐藏
 */

- (void)showOrderFinishWithAddressStr:(NSString *)addressStr
                         withTotalFls:(NSString *)totalFls
                         withTotalYjs:(NSString *)totalYjs{
    
    [self.containerView setFrame:CGRectMake(0, 0, self.containerView.bounds.size.width,120+44)] ;
    
    [self showWithAnimation];
    if (!self.finishAllView) {
        self.finishAllView  = [[LZOrderFinishedAllView alloc]initWithFrame:CGRectMake(0, 0, self.containerView.bounds.size.width, self.containerView.bounds.size.height-alertButtonHeight-1)];
        self.finishAllView.addressStr = addressStr;
        self.finishAllView.totalFls = totalFls;
        self.finishAllView.totalYjs = totalYjs;
        [self.containerView addSubview:self.finishAllView];
    }
    
    
}

//取消正在执行的订单
- (void)showOrderRunAlertView{


    
    [self.containerView setFrame:CGRectMake(0, 0, kSCREEN_WIDTH-100,100+44)] ;
    
    [self showWithAnimation];
    if (!self.orderRunAlertView) {
        self.orderRunAlertView  = [[LZOrderRunAlertView alloc]initWithFrame:CGRectMake(0, 0, self.containerView.bounds.size.width, self.containerView.bounds.size.height-alertButtonHeight-1)];

        [self.containerView addSubview:self.orderRunAlertView];
    }
    
    
}


- (void)showWithAnimation{
    
    [self addViews];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.containerView.frame.size.height;
    self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT/ 2);
        self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    
}
- (void)addBtnViews{

    
    NSArray * array = @[@"取消",@"确认"];
    
    for (int i =0 ; i <array.count; i++) {
        
        @autoreleasepool {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag  = 1000+i;
            [btn setTitle:array[i] forState:UIControlStateNormal];
            if (i==0) {
                btn.backgroundColor = [UIColor whiteColor];
                [btn setTitleColor:[UIColor colorWithHexString:@"#e7e7e7"] forState:UIControlStateNormal];
            }else{
                btn.backgroundColor = [UIColor colorWithHexString:@"#41d1e7"];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.frame = CGRectMake(i * self.containerView.bounds.size.width/2.0, self.containerView.bounds.size.height-alertButtonHeight,  self.containerView.bounds.size.width/2.0, alertButtonHeight);
            [btn addTarget:self action:@selector(isClickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.containerView addSubview:btn];
            
        }
        
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#e7e7e7"];
        [self.containerView addSubview:lineView];
        
        if (i==0) {
            lineView.frame = CGRectMake((self.containerView.bounds.size.width-1)/2.0, self.containerView.bounds.size.height-alertButtonHeight, 1, alertButtonHeight);
            
        }else{
            lineView.frame = CGRectMake(0, self.containerView.bounds.size.height-alertButtonHeight-1, self.containerView.bounds.size.width, 1);
        }
        
    }
    
    
    //设置部分圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5,5)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.containerView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    self.containerView.layer.mask = maskLayer;
    
}


- (void)hiddenWithAnimation
{
    CGFloat height = self.containerView.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT + height / 2);
        self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self hiddenViews];
    }];
    
}
- (void)addViews{
    [self removeFromSuperview];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.maskView];
    [window addSubview:self.containerView];
    [self addBtnViews];
    [self.containerView addSubview:self];
}
- (void)hiddenViews {
    [self removeFromSuperview];
    [self.maskView removeFromSuperview];
    [self.containerView removeFromSuperview];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
