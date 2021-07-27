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
//        NSLog(@"max width %lf",[UIFont dynamicWordSize]);
        //设置默认高度
//        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        CGFloat wordWidth = 2*height-2*gap;
        CGFloat iconWidth = height;
    
        UIView* iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, iconWidth, iconWidth)];
        iconView.layer.cornerRadius = 0.5*iconWidth;
        iconView.layer.masksToBounds = YES;
        iconView.backgroundColor = [UIColor greenColor];
        
        UIView* textBgView = [[UIView alloc] initWithFrame:CGRectMake(0.5*iconWidth, 0.2*iconWidth, 2.5*iconWidth, 0.6*iconWidth)];
        textBgView.layer.cornerRadius = 5;
        textBgView.layer.masksToBounds = YES;
        textBgView.backgroundColor = [UIColor blueColor];
        
        //计算文字大小
        CGSize titleSize = [content sizeWithAttributes:@{NSFontAttributeName: [UIFont smallWordSize]}];
        UILabel* contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5*iconWidth+gap, 0.5*( textBgView.frame.size.height-titleSize.height),wordWidth, titleSize.height)];
        contentLabel.backgroundColor = [UIColor yellowColor];
        contentLabel.text = content;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = [UIFont smallWordSize];
        
        [self addSubview:textBgView];
        [self addSubview:iconView];
        [textBgView addSubview:contentLabel];

        
    }
    return self;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
