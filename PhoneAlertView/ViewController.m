//
//  ViewController.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "ViewController.h"
#import "LZPhoneAlertView.h"
#import "LZOrderAlertView.h"
#import "ZoomImage.h"

@interface ViewController ()

@property(nonatomic,strong)LZPhoneAlertView * alertView;
@property(nonatomic,strong)LZOrderAlertView * orderAlertView;

@property(nonatomic,strong)ZoomImage * zoomImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  self.alertView  = [[LZPhoneAlertView alloc]init];
    
    self.orderAlertView = [[LZOrderAlertView alloc]init];
    
    
    
    NSArray * array = @[@"one",@"Two",@"three",@"Four",@"Five"];
    
    for (int i = 0; i < array.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom ];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(icClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag  = 1000+i;
        btn.frame = CGRectMake(50, 100+i*(50+20), 80, 50);
        [self.view addSubview:btn];
        btn.backgroundColor = [UIColor redColor];
    }
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)icClick:(UIButton *)btn{
    switch (btn.tag) {
        case 1000:
        {
            LZOrderAlertView * orderAlertOneView = [[LZOrderAlertView alloc]init];
            [orderAlertOneView showCarFinishWithCarNumber:@"渝A5200" withCarNumberTotal:@"99999" withTotalFls:@"29" withTotalYjs:@"100"];
            [orderAlertOneView setClickSureHandle:^{
                NSLog(@"orderAlertOneView 确定点击");
            }];
            
            [orderAlertOneView setClickCancleHandle:^{
                NSLog(@"orderAlertOneView 取消点击");
            }];
            
        }
            break;
        case 1001:
        {
            LZOrderAlertView * orderAlertTwoView = [[LZOrderAlertView alloc]init];
            [orderAlertTwoView showCarOnceFinishWithCarNumber:@"渝A5200" withDriverName:@"我是驾驶员" withTotalFls:@"100" withTotalYjs:@"200"];
            [orderAlertTwoView setClickSureHandle:^{
                NSLog(@"orderAlertTwoView 确定点击");
            }];
            
            [orderAlertTwoView setClickCancleHandle:^{
                NSLog(@"orderAlertTwoView 取消点击");
            }];
        }
            break;
        case 1002:
        {
            LZOrderAlertView * orderAlertThreeView = [[LZOrderAlertView alloc]init];
            [orderAlertThreeView showOrderFinishWithAddressStr:@"重庆市石桥铺轻轨1号线" withTotalFls:@"100" withTotalYjs:nil];
            [orderAlertThreeView setClickSureHandle:^{
                NSLog(@"orderAlertThreeView 确定点击");
            }];
            
            [orderAlertThreeView setClickCancleHandle:^{
                NSLog(@"orderAlertThreeView 取消点击");
            }];
        }
            break;
            
        case 1003:
        {
            LZOrderAlertView * orderAlertFourView = [[LZOrderAlertView alloc]init];
            [orderAlertFourView showOrderRunAlertView];
            
            [orderAlertFourView setClickSureHandle:^{
                NSLog(@"orderAlertFourView 确定点击");
            }];
            
            [orderAlertFourView setClickCancleHandle:^{
                NSLog(@"orderAlertFourView 取消点击");
            }];
        }
            break;
            
        case 1004:
        {
            LZOrderAlertView * orderAlertFiveView = [[LZOrderAlertView alloc]init];
            [orderAlertFiveView showOrderFinishWithAddressStr:@"重庆市石桥铺轻轨" withTotalFls:@"100" withTotalYjs:@"200"];
            
            [orderAlertFiveView setClickSureHandle:^{
                NSLog(@"orderAlertFourView 确定点击");
            }];
            
            [orderAlertFiveView setClickCancleHandle:^{
                NSLog(@"orderAlertFourView 取消点击");
            }];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    ZoomImage * zoomImage =   [[ZoomImage alloc]init];
    [zoomImage showWithImageUrl:@""];
    
    // [self.orderAlertView showOrderType:kTypeWithCarFinished];
    
    
    //[self.alertView showMobileName:@"测试电话" withMobilePhone:@"15826437547"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
