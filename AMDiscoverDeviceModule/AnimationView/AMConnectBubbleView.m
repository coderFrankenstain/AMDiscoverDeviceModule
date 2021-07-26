//
//  AMConnectBubbleView.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import "AMConnectBubbleView.h"
#import "UIFont+WordSize.h"
#define gap 5
#define AMMaxWidth [UIScreen mainScreen].bounds.size.width / 8
#define fontSize 13
@implementation AMConnectBubbleView

+ (CGFloat) bubbleWidth {
    return AMMaxWidth;
}

- (instancetype) initWithIcon:(NSString*) iconName content:(NSString*) content {
    if (self = [super init]) {
        
        //字体大小
        NSLog(@"max width %lf",[UIFont dynamicWordSize]);
        //设置默认高度
    
        UIView* iconView = [[UIView alloc] init];
        iconView.layer.cornerRadius = 0.5*AMMaxWidth;
        iconView.layer.masksToBounds = YES;
        iconView.backgroundColor = [UIColor greenColor];
        
        UIView* textBgView = [[UIView alloc] init];
        textBgView.layer.cornerRadius = 5;
        textBgView.layer.masksToBounds = YES;
        textBgView.backgroundColor = [UIColor blueColor];
        
        UILabel* contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor = [UIColor yellowColor];
        contentLabel.text = content;
        contentLabel.font = [UIFont smallWordSize];
        
        [self addSubview:textBgView];
        [self addSubview:iconView];
        [textBgView addSubview:contentLabel];

        
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(AMMaxWidth);
            make.left.mas_equalTo(0);
        }];
        
        [textBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(iconView.mas_centerY);
            make.left.mas_equalTo(iconView.mas_left).offset(AMMaxWidth*0.5);
            make.right.mas_equalTo(self.mas_right);
            make.width.mas_lessThanOrEqualTo(AMMaxWidth*3);
        }];
        
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(textBgView.mas_left).offset(AMMaxWidth*0.5+gap);
            make.right.mas_equalTo(textBgView.mas_right).offset(-gap);
            make.top.mas_equalTo(textBgView.mas_top).offset(gap);
            make.bottom.mas_equalTo(textBgView.mas_bottom).offset(-gap);
        }];
        
    
    }
    return self;
}



- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

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
