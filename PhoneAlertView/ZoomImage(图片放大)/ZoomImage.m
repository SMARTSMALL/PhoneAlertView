

//
//  ZoomImage.m
//  PhoneAlertView
//
//  Created by goldeneye on 2017/3/14.
//  Copyright © 2017年 goldeneye by smart-small. All rights reserved.
//

#import "ZoomImage.h"

#define kSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define kISCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height



@interface ZoomImage()<UIScrollViewDelegate>


/**  容器 **/
@property(nonatomic,strong)UIView * containerView;
/**  背景蒙版 **/
@property(nonatomic,strong)UIView * maskView;

@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)UIView * contentBgView;
@end

@implementation ZoomImage

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



- (void)showWithImageUrl:(NSString *)url{

    [self showWithAnimation];

}
- (void)initMaskView{
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kISCREEN_HEIGHT)];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.maskView.userInteractionEnabled = YES;
    [ self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)]];
}

- (void)initContainerView{
    
    UIImage * image =  [UIImage imageNamed:@"delete"];
    
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_WIDTH+image.size.height/2.0)];
    self.containerView .backgroundColor = [UIColor clearColor];
    
    [self addScollViewContent];

}

- (void)addScollViewContent{

    UIImage * delImage =  [UIImage imageNamed:@"delete"];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, delImage.size.height/2.0, kSCREEN_WIDTH, kSCREEN_WIDTH)];    //添加一个Scrollview到当前视图
    [self.containerView addSubview:self.scrollView];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    //实现Scrollview的代理，需要在.h 文件中添加
    //self.scrollView.bounces = NO;
    //self.scrollView.bouncesZoom = NO;
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.maximumZoomScale = 5;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH , kSCREEN_WIDTH  );
    
    self.contentBgView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kSCREEN_WIDTH, kSCREEN_WIDTH)];   //添加一个UIView
    self.contentBgView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:self.contentBgView];
    
    
    NSString *pathfile = [[NSBundle mainBundle]pathForResource:@"textimage" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:pathfile];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, kSCREEN_WIDTH, kSCREEN_WIDTH)];
    [image setImage:[UIImage imageWithData:data]];
    
    [self.contentBgView addSubview:image];
    
    UIButton * delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [delBtn setImage: delImage forState:UIControlStateNormal];
    delBtn.frame = CGRectMake(kSCREEN_WIDTH-delBtn.imageView.image.size.width, 0, delBtn.imageView.image.size.width, delBtn.imageView.image.size.height);
    [delBtn addTarget:self action:@selector(delBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:delBtn];
    

}

- (void)delBtnClick
{
    [self hiddenWithAnimation];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)tmpScrollView
{
    return self.contentBgView;
}

- (void)showWithAnimation{
    
    [self addViews];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.containerView.frame.size.height;
    self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.center = CGPointMake(kSCREEN_WIDTH / 2, kISCREEN_HEIGHT  / 2);
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


@end
