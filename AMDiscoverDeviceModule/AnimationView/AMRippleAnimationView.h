//
//  AMRippleAnimationView.h
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMRippleAnimationView : UIView
//设置缩放因子
@property (nonatomic, assign) CGFloat scaleFactor;
 
- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
