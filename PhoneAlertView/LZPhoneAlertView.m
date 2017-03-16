

//
//  LZPhoneAlertView.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "LZPhoneAlertView.h"

#define kSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define kISCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


@interface LZPhoneAlertView()

/**  容器 **/
@property(nonatomic,strong)UIView * containerView;
/**  背景蒙版 **/
@property(nonatomic,strong)UIView * maskView;

@end

@implementation LZPhoneAlertView

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

- (void)showMobileName:(NSString *)name withMobilePhone:(NSString *)phone{
    
    UILabel * label = [self.containerView viewWithTag:1001];
    label.text = [NSString stringWithFormat:@"%@:%@",name,phone];
    [self showWithAnimation];
    
}


- (void)initMaskView{
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kISCREEN_HEIGHT)];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.maskView.userInteractionEnabled = YES;
    [ self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)]];
}

- (void)initContainerView{
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 44*3)];
    self.containerView .backgroundColor = [UIColor whiteColor];
    
    NSArray * array = @[@"联系电话",@"匿名:未知",@"取消"];
    
    for (int i= 0 ; i < array.count; i++) {
        @autoreleasepool {
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, i * 44, kSCREEN_WIDTH, 44)];
            label.text = array[i];
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.tag = 1000+i;
            [self.containerView addSubview:label];
            
            if (i==1) {
                label.userInteractionEnabled = YES;
                
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(isClickLabelPhone)];
                [label addGestureRecognizer:tap];
                
            }else if (i==2){
                label.userInteractionEnabled = YES;
                
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(isClickLabelCancle)];
                [label addGestureRecognizer:tap];
            }
            
            if (i<2) {
                UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, (i+1)*44, kSCREEN_WIDTH, 2)];
                lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
                [self.containerView addSubview:lineView];
            }
        }
    }
    
    //设置部分圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5,5)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.containerView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    self.containerView.layer.mask = maskLayer;

}

//点击取消
- (void)isClickLabelCancle{
    
    
    [self hiddenWithAnimation];
    
}
//点击拨打号码
- (void)isClickLabelPhone{
    
    [self hiddenWithAnimation];
    
    UILabel * label = [self.containerView viewWithTag:1001];
    NSLog(@"text===%@",label.text);
    
    NSArray * array = [label.text componentsSeparatedByString:@":"];
    
    if (array.count>=2) {
        
        NSString * phoneStr = array[1];
        
        if ([phoneStr isEqual:[NSNull null]] || [phoneStr isEqualToString:@"未知"]||[phoneStr isEqualToString:@""] || phoneStr ==nil) {
            [self shwoErrorMessage:@"电话号码有误"];
        }else{
            //判断能否打电话
            
            NSString *deviceType = [UIDevice currentDevice].model;
            
            if([deviceType  isEqualToString:@"iPod touch"]||[deviceType  isEqualToString:@"iPad"]||[deviceType  isEqualToString:@"iPhone Simulator"]){
                [self shwoErrorMessage:@"您的设备不能打电话"];
            }else{
#if TARGET_IPHONE_SIMULATOR
                [self shwoErrorMessage:@"您的设备不能打电话"];
#define SIMULATOR_TEST
#else
                //打电话的方法
                NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"%@", [NSString stringWithFormat:@"tel://%@",phoneStr]];
                NSLog(@"str======%@",str);
                //优点：拨打完以后可以返回到原来应用上
                UIWebView *webView = [[UIWebView alloc]init];
                NSURL *url = [NSURL URLWithString:str];
                [webView loadRequest:[NSURLRequest requestWithURL:url]];
                [self addSubview:webView];
                
#endif
                
            }
        }
    }else{
        
        [self shwoErrorMessage:@"电话号码有误"];
    }
    
    
    
}
//显示错误提示
- (void)shwoErrorMessage:(NSString *)message{
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    
    [alert show];
}

- (void)showWithAnimation{
    
    [self addViews];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.containerView.frame.size.height;
    self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT - height / 2);
        self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    
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
