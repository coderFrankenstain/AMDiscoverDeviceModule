//
//  AMDiscoverView.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import "AMDiscoverView.h"
#import "AMRippleAnimationView.h"
#import "AMConnectBubbleView.h"
#define gap 10

#define AMFlexWidth [UIScreen mainScreen].bounds.size.width / 8
#define BubleWidth 3*AMFlexWidth
#define BubleHeigth AMFlexWidth
@implementation AMDiscoverView

- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame index:(NSInteger) index{
    if (self = [super initWithFrame:frame]) {
        
        AMRippleAnimationView* animationView = [[AMRippleAnimationView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/1.6,  frame.size.width/1.6)];
        animationView.center = self.center;
        [self addSubview:animationView];
            
        //中间ICON
        UIView* iconBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, animationView.frame.size.width*0.5, animationView.frame.size.width*0.5)];
        iconBgView.backgroundColor = ColorWithAlpha(83, 150, 230, 1);
        iconBgView.center = self.center;
        iconBgView.layer.cornerRadius = 0.5*iconBgView.frame.size.width;
        iconBgView.layer.masksToBounds = YES;
        [self addSubview:iconBgView];
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconBgView.frame.size.width*0.4, iconBgView.frame.size.height*0.4)];
        imageView.center = self.center;
        [imageView setImage:[UIImage imageNamed:@"Apple"]];
        [self addSubview:imageView];
        
        //基本半径
        CGFloat baseR = iconBgView.width*0.5 + 0.5*BubleHeigth+3*gap;
        NSInteger count = (NSInteger)index;
        
        
        for (int i = 0; i < count;i++) {
            //旋转角度
            CGFloat angle = 30 + i*(360*1.0/count*1.0);

            CGPoint bublePoint = [self randomRadius:iconBgView.center andWithAngle:angle andWithRadius:baseR];

            AMConnectBubbleView* discover = [[AMConnectBubbleView alloc] initWithIcon:@"" content:[NSString stringWithFormat:@"index %d",i] andFrame:CGRectMake(0, 0, BubleWidth, BubleHeigth)];
            [discover setCenter:bublePoint];
            [self addSubview:discover];
        }
        
    }
    return self;
}

- (BOOL) isInRect:(CGPoint) point{
    
    point.x = point.x - 0.5*BubleWidth;
    point.y = point.y - 0.5*BubleHeigth;
    
    if (point.x < 0 || point.x + BubleWidth > self.width || point.y < 0 || point.y+BubleHeigth > self.height) {
        
        return NO;
    }
    else {
        return YES;
    }
}


- (CGPoint)calcCircleCoordinateWithCenter:(CGPoint)center  andWithAngle:(CGFloat) angle andWithRadius:(CGFloat)radius{
    
    CGFloat x2 = radius * cosf(angle * M_PI/180);

    CGFloat y2 = radius * sinf(angle * M_PI/180);
        
    return CGPointMake(center.x+x2, center.y + y2);

    
}

- (CGPoint) randomRadius:(CGPoint)center  andWithAngle:(CGFloat) angle andWithRadius:(CGFloat)radius {
    CGFloat baseR = radius;
    //半径区间变化
    radius = baseR+arc4random()%(6*gap);
    
    NSLog(@"随机半径 %lf",radius);

    
    CGPoint point = [self calcCircleCoordinateWithCenter:center andWithAngle:angle andWithRadius:radius];
    
    if (![self isInRect:point]) {
        radius = baseR;
        point = [self calcCircleCoordinateWithCenter:center andWithAngle:angle andWithRadius:radius];
    }
    
    return point;
}




@end
