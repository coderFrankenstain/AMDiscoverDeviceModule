//
//  AMConnectBubbleView.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import "AMConnectBubbleView.h"
#import "UIFont+WordSize.h"
#define gap 5


@implementation AMConnectBubbleView


- (instancetype) initWithIcon:(NSString*) iconName content:(NSString*) content andFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        
        //字体大小
        CGFloat height = frame.size.height;
        CGFloat wordWidth = 2*height-2*gap;
        CGFloat iconWidth = height;
    
        UIView* iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, iconWidth, iconWidth)];
        iconView.layer.cornerRadius = 0.5*iconWidth;
        iconView.layer.masksToBounds = YES;
        iconView.backgroundColor = ColorWithAlpha(255, 172, 89, 1);
        
        UIImageView* iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, iconWidth-10, iconWidth-10)];
        [iconImage setImage:[UIImage imageNamed:@"iPhoneX"]];
        [iconView addSubview:iconImage];
        
        UIView* textBgView = [[UIView alloc] initWithFrame:CGRectMake(0.5*iconWidth, 0.2*iconWidth, 2.5*iconWidth, 0.6*iconWidth)];
        textBgView.layer.cornerRadius = 5;
        textBgView.layer.masksToBounds = YES;
        textBgView.backgroundColor = [UIColor whiteColor];
        
        //计算文字大小
        CGSize titleSize = [content sizeWithAttributes:@{NSFontAttributeName: [UIFont smallWordSize]}];
        UILabel* contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5*iconWidth+gap, 0.5*( textBgView.frame.size.height-titleSize.height),wordWidth, titleSize.height)];
        contentLabel.text = content;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = [UIFont smallWordSize];
        
        [self addSubview:textBgView];
        [self addSubview:iconView];
        [textBgView addSubview:contentLabel];

        [self.layer addAnimation:[self showAnimation] forKey:@"showAnimation"];
        
    }
    return self;
}


//缩放出场动画
- (CABasicAnimation*) showAnimation {
    CASpringAnimation* animation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    
    //起始值
    animation.fromValue = @(0);
    //结束值
    animation.toValue = @(1);
    //起始值
    animation.duration = 1;
        
    return animation;
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"点击事件");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
