//
//  RippleAnimationView.m
//  mediaDemo
//
//  Created by mac on 2020/11/10.
//  Copyright © 2020 mac. All rights reserved.
//

#import "AMRippleAnimationView.h"
// 设置静态常量 pulsingCount ，表示 Layer 的数量
static NSInteger const pulsingCount = 3;

// 设置静态常量 animationDuration ，表示动画时间
static double const animationDuration = 3;


@interface AMRippleAnimationView()

@end


@implementation AMRippleAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _multiple = 1.6;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
  //判断layer是否等于0 如果等于0则表示 此时没有图层，防止重复绘制
    if (self.layer.sublayers.count == 0) {
        CALayer *animationLayer = [CALayer layer];
        for(int i = 0; i < pulsingCount; i++){
            CAAnimationGroup* animationGroup = [self animationGroupAnimations:[self animationArray] index:i];
            CALayer* pulsingLayer = [self pulsingLayer:rect animation:animationGroup];
            [animationLayer addSublayer:pulsingLayer];
        }
        
        [self.layer addSublayer:animationLayer];
//        [self.layer addSublayer:[self iconLayer:CGRectMake(0.25*rect.size.width+rect.origin.x, 0.25*rect.size.height+rect.origin.y, rect.size.width*0.5, rect.size.height*0.5)]];
    }
    
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

#pragma BasicAnimation

- (CALayer *)pulsingLayer:(CGRect)rect animation:(CAAnimationGroup *)animationGroup {
    
    CALayer* pulsingLayer = [CALayer layer];
    
    //取消边框
//    pulsingLayer.borderWidth = 0.5;
    pulsingLayer.borderColor = ColorWithAlpha(255, 216, 87, 0.5).CGColor;
    pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    pulsingLayer.cornerRadius = rect.size.height / 2;
    
    [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
    
    return pulsingLayer;
}


- (CAAnimationGroup*) animationGroupAnimations:(NSArray*) array index:(int)index{
    
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    
    animationGroup.beginTime = CACurrentMediaTime() + (double)(index * animationDuration) / (double)pulsingCount;
    animationGroup.duration = 3;
    animationGroup.repeatCount = HUGE;
    animationGroup.animations = array;
    animationGroup.removedOnCompletion = NO;
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];

    return animationGroup;
}

- (NSArray*) animationArray {
    
    NSArray *animationArray = nil;
    
    CABasicAnimation* scaleAnimation = [self scaleAnimation];
    CAKeyframeAnimation* backgroudColorAnimation = [self backgroudColorAnimation];
//    CAKeyframeAnimation* borderColorAnimation = [self borderColorAnimation];
    animationArray = @[scaleAnimation,backgroudColorAnimation];
    
    return animationArray;
}


- (CABasicAnimation*) scaleAnimation {
    
    CABasicAnimation* scaleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.fromValue = @(0.1);
    scaleAnimation.toValue = @(_multiple);
    
    return scaleAnimation;
}


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

//- (CAKeyframeAnimation*) borderColorAnimation {
//    CAKeyframeAnimation *borderColorAnimation = [CAKeyframeAnimation animation];
//
//    borderColorAnimation.keyPath = @"borderColor";
//    borderColorAnimation.values = @[(__bridge id)ColorWithAlpha(255, 216, 87, 0.5).CGColor,
//                                        (__bridge id)ColorWithAlpha(255, 231, 152, 0.5).CGColor,
//                                        (__bridge id)ColorWithAlpha(255, 241, 197, 0.5).CGColor,
//                                        (__bridge id)ColorWithAlpha(255, 241, 197, 0).CGColor];
//    borderColorAnimation.keyTimes = @[@0.3,@0.6,@0.9,@1];
//
//    return borderColorAnimation;
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
