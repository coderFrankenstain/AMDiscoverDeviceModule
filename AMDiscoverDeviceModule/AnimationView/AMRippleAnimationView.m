//
//  RippleAnimationView.m
//  mediaDemo
//
//  Created by mac on 2020/11/10.
//  Copyright © 2020 mac. All rights reserved.
//

#import "AMRippleAnimationView.h"

#define WJRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 表示涟漪数量(原图层加复制图层)
static NSInteger const rippleCount = 3;

//涟漪间隔时间
static double const rippleDuration = 1;

// 表示动画时间持续时间
static double const animationDuration = 3;

@interface AMRippleAnimationView()

@end

@implementation AMRippleAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.scaleFactor = 1.6;
        
        [self.layer addSublayer:[self replicatorLayer:frame]];
        [self.layer addSublayer:[self iconLayer:CGRectMake(0.25*frame.size.width+frame.origin.x, 0.25*frame.size.height+frame.origin.y, frame.size.width*0.5, frame.size.height*0.5)]];
    }
    return self;
}


#pragma iconLayer
- (CALayer*) iconLayer:(CGRect) rect{
    CALayer* iconLayer = [[CALayer alloc] init];
    iconLayer.backgroundColor = ColorWithAlpha(83, 150, 230, 1).CGColor;
    iconLayer.frame = rect;
    iconLayer.cornerRadius = 0.5*rect.size.width;
    iconLayer.masksToBounds = YES;
    
    CALayer* imageLayer = [[CALayer alloc] init];
    imageLayer.frame = CGRectMake(iconLayer.frame.size.width*0.3, iconLayer.frame.size.height*0.3, iconLayer.frame.size.width*0.4, iconLayer.frame.size.height*0.4);
    imageLayer.contentsCenter = iconLayer.contentsCenter;
    imageLayer.contents = (id)[UIImage imageNamed:@"Apple"].CGImage;
    [iconLayer addSublayer:imageLayer];
    
    return iconLayer;
}

//复制图层
- (CAReplicatorLayer*) replicatorLayer:(CGRect) rect {
    CAReplicatorLayer* replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.instanceCount = rippleCount;
    replicatorLayer.instanceDelay = rippleDuration;
    
    [replicatorLayer addSublayer:[self rippleBaseAnimationLayer:rect]];
    return replicatorLayer;
}

- (CALayer *) rippleBaseAnimationLayer:(CGRect) rect {
    
    CALayer* baseLayer = [CALayer layer];
    
    baseLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    baseLayer.cornerRadius = rect.size.height / 2;
    
    [baseLayer addAnimation:[self rippleAnimation] forKey:@"rippleAnimationGroup"];
    
    return baseLayer;
}

//缩放动画
-(CABasicAnimation*) scaleAnimation{
    
    CABasicAnimation* scaleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.fromValue = @(0.1);
    scaleAnimation.toValue = @(self.scaleFactor);
    
    return scaleAnimation;
    
}

//背景颜色变化
- (CAKeyframeAnimation*) backgroudColorAnimation {
    
    CAKeyframeAnimation *backgroundColorAnimation = [CAKeyframeAnimation animation];

    backgroundColorAnimation.keyPath = @"backgroundColor";
    backgroundColorAnimation.values = @[(__bridge id)ColorWithAlpha(83, 150, 230, 0.5).CGColor,
                                        (__bridge id)ColorWithAlpha(172, 206, 245, 0.5).CGColor,
                                        (__bridge id)ColorWithAlpha(196, 221, 248, 0.5).CGColor,
                                        (__bridge id)ColorWithAlpha(227, 239, 251, 0).CGColor,
                                        ];
    backgroundColorAnimation.keyTimes = @[@0.3,@0.6,@0.9,@1];
    
    return backgroundColorAnimation;
}

//涟漪组合动画
- (CAAnimationGroup*) rippleAnimation{
    
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = MAXFLOAT;
    animationGroup.animations = @[[self scaleAnimation],[self backgroudColorAnimation]];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    return animationGroup;
}


@end
