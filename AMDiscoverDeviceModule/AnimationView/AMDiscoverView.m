//
//  AMDiscoverView.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import "AMDiscoverView.h"
#import "AMRippleAnimationView.h"
#import "AMConnectBubbleView.h"
#define gap [AMConnectBubbleView bubbleWidth]
@implementation AMDiscoverView

- (instancetype) init {
    if (self = [super init]) {
       
        
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
      
    }
    return self;
}

- (void) setupViews {
    //动画背景
    AMRippleAnimationView* animationView = [[AMRippleAnimationView alloc] init];
    [self addSubview:animationView];
        
    //中间ICON
    UIView* iconBgView = [[UIView alloc] init];
    iconBgView.backgroundColor = ColorWithAlpha(83, 150, 230, 1);
    [self addSubview:iconBgView];
    

    UIImageView* imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"Apple"]];
    [iconBgView addSubview:imageView];
    
    
    [animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(animationView.superview);
        make.size.mas_equalTo(animationView.superview).dividedBy(1.6);
    }];
    
    
    [iconBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(animationView).multipliedBy(0.5);
        make.center.mas_equalTo(iconBgView.superview);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(imageView.superview);
        make.size.mas_equalTo(imageView.superview).multipliedBy(0.4);
    }];
    
    
    NSArray* arrays = @[@"coderjun'iphone",@"aomei",@"iphone4",@"Macmini",@"macbook",@"retina"];
    
    for(int i =0 ; i < 6 ;i++){
        AMConnectBubbleView* bubleView = [[AMConnectBubbleView alloc] initWithIcon:@"coderjun" content:arrays[i]];
        [self addSubview:bubleView];
        
        CGFloat topGap = (gap)*(i);
        CGFloat hGap = 10;
        
                                                   
        
        if ((i ) % 2 == 0) {
            //下标为偶数
            NSLog(@"");
            [bubleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(bubleView.superview).offset(hGap);
                make.top.mas_equalTo(topGap);
                make.right.mas_lessThanOrEqualTo(iconBgView.mas_left).offset(0);
            }];

        }
        else {
            //下标为奇数
            [bubleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_greaterThanOrEqualTo(iconBgView.mas_right).offset(0);
                make.top.mas_equalTo(topGap);
                make.right.mas_equalTo(bubleView.superview).offset(-hGap);
            }];
        }
        
    }
    
    [self layoutIfNeeded];
    iconBgView.layer.cornerRadius = 0.5*iconBgView.frame.size.width;
    iconBgView.layer.masksToBounds = YES;

}


@end
