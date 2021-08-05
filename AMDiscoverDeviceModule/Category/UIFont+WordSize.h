//
//  UIFont+WordSize.h
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/23.
//

#import <UIKit/UIKit.h>
#define AMWidth
NS_ASSUME_NONNULL_BEGIN

@interface UIFont (WordSize)
+ (UIFont*) smallWordSize;
+(CGFloat) dynamicWordSize;
@end

NS_ASSUME_NONNULL_END
