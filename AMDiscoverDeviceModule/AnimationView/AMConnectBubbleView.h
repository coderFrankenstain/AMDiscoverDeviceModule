//
//  AMConnectBubbleView.h
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMConnectBubbleView : UIView
- (instancetype) initWithIcon:(NSString*) iconName content:(NSString*) content;
+ (CGFloat) bubbleWidth;
@end

NS_ASSUME_NONNULL_END
