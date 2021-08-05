//
//  AMDiscoverView.h
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMDiscoverView : UIView
- (instancetype) initWithFrame:(CGRect)frame;

@property(strong,nonatomic) NSArray* models;

@end

NS_ASSUME_NONNULL_END
