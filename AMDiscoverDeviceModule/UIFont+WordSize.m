//
//  UIFont+WordSize.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/23.
//

#import "UIFont+WordSize.h"

@implementation UIFont (WordSize)
//小号字体动态设置
+ (UIFont*) smallWordSize {

    return [UIFont systemFontOfSize:[self dynamicWordSize]];
}
//
////字体与宽30比字体大小
+(CGFloat) dynamicWordSize {
    
    return  ceil([UIScreen mainScreen].bounds.size.width/30);
}

@end
