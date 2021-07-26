//
//  AMRippleAnimationView.h
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMRippleAnimationView : UIView
@property (nonatomic, assign) CGFloat multiple;
//设置缩放倍数
- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
