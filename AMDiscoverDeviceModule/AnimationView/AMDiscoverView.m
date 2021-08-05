//
//  AMDiscoverView.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import "AMDiscoverView.h"
#import "AMRippleAnimationView.h"
#import "AMConnectBubbleView.h"
#import "AMBubbleModel.h"
#define gap 10

//根据当前屏幕宽度计算泡泡视图的大小
#define AMFlexWidth [UIScreen mainScreen].bounds.size.width / 8
//泡泡视图的宽度
#define BubleWidth 3*AMFlexWidth
//泡泡视图的高度
#define BubleHeigth AMFlexWidth

@interface AMDiscoverView()
@property(strong,nonatomic) UIView* iconView;
@end

@implementation AMDiscoverView

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        AMRippleAnimationView* animationView = [[AMRippleAnimationView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/1.6,  frame.size.width/1.6)];
        animationView.center = self.center;
        [self addSubview:animationView];
            
        //中间ICON
        UIView* iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, animationView.frame.size.width*0.5, animationView.frame.size.width*0.5)];
        iconView.backgroundColor = ColorWithAlpha(83, 150, 230, 1);
        iconView.center = self.center;
        iconView.layer.cornerRadius = 0.5*iconView.frame.size.width;
        iconView.layer.masksToBounds = YES;
        [self addSubview:iconView];
        self.iconView = iconView;

        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconView.frame.size.width*0.4, iconView.frame.size.height*0.4)];
        imageView.center = self.center;
        [imageView setImage:[UIImage imageNamed:@"Apple"]];
        [self addSubview:imageView];
    }
    return self;
}

- (void)setModels:(NSArray *)models{
    _models = models;
    //设置基本半径
    CGFloat baseR = self.iconView.frame.size.width*0.5 + 0.5*BubleHeigth+3*gap;
    //随机起始角度
    CGFloat startAngle = arc4random() % 360;
    
    for(int i = 0;i < models.count;i++){
        
        AMBubbleModel* model = [models objectAtIndex:i];
        
        //计算当前泡泡视图的旋转的角度
        CGFloat angle = startAngle + i*(360.0/models.count);
        //计算泡泡视图的中心点
        CGPoint bublePoint = [self randomRadius:self.iconView.center andWithAngle:angle andWithRadius:baseR];
        //添加一个泡泡视图
        AMConnectBubbleView* discover = [[AMConnectBubbleView alloc] initWithIcon:model.icon content:model.title andFrame:CGRectMake(0, 0, BubleWidth, BubleHeigth)];
        [discover setCenter:bublePoint];
        [self addSubview:discover];
    }
    
}

//- (void) setDataArray:(NSArray *)dataArray {
//
//    _dataArray = dataArray;
//    //基本半径
//    CGFloat baseR = self.iconView.frame.size.width*0.5 + 0.5*BubleHeigth+3*gap;
//    //随机起始角度
//    CGFloat startAngle = arc4random() % 360;
//
//    for (int i = 0; i < dataArray.count;i++) {
//        //旋转角度
//        CGFloat angle = startAngle + i*(360*1.0/dataArray.count*1.0);
//        CGPoint bublePoint = [self randomRadius:self.iconView.center andWithAngle:angle andWithRadius:baseR];
//
//        AMConnectBubbleView* discover = [[AMConnectBubbleView alloc] initWithIcon:@"" content:[NSString stringWithFormat:@"index %d",i] andFrame:CGRectMake(0, 0, BubleWidth, BubleHeigth)];
//        [discover setCenter:bublePoint];
//        [self addSubview:discover];
//    }
//}
//
//-(void)setCount:(NSInteger)count {
//    //基本半径
//    CGFloat baseR = self.iconView.frame.size.width*0.5 + 0.5*BubleHeigth+3*gap;
//    //随机角度
//    CGFloat startAngle = arc4random() % 360;
//
//    for (int i = 0; i < count;i++) {
//        //旋转角度
//        CGFloat angle = startAngle + i*(360*1.0/count*1.0);
//        CGPoint bublePoint = [self randomRadius:self.iconView.center andWithAngle:angle andWithRadius:baseR];
//
//        AMConnectBubbleView* discover = [[AMConnectBubbleView alloc] initWithIcon:@"" content:[NSString stringWithFormat:@"index %d",i] andFrame:CGRectMake(0, 0, BubleWidth, BubleHeigth)];
//        [discover setCenter:bublePoint];
//        [self addSubview:discover];
//    }
//
//}

//视图是否超过DiscoverView
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

//根据中心点，角度，半径计算出目标中心点
- (CGPoint)calcCircleCoordinateWithCenter:(CGPoint)center  andWithAngle:(CGFloat) angle andWithRadius:(CGFloat)radius{
    
    CGFloat x2 = radius * cosf(angle * M_PI/180);

    CGFloat y2 = radius * sinf(angle * M_PI/180);
        
    return CGPointMake(center.x+x2, center.y + y2);

}

//根据基本半径生成随机半径，并且判断生成的新半径是否在矩形范围内
- (CGPoint) randomRadius:(CGPoint)center  andWithAngle:(CGFloat) angle andWithRadius:(CGFloat)radius {
    CGFloat baseR = radius;
    //随机半径
    radius = baseR+arc4random()%(6*gap);

    CGPoint point = [self calcCircleCoordinateWithCenter:center andWithAngle:angle andWithRadius:radius];
    
    if (![self isInRect:point]) {
        radius = baseR;
        point = [self calcCircleCoordinateWithCenter:center andWithAngle:angle andWithRadius:radius];
    }
    
    return point;
}




@end
