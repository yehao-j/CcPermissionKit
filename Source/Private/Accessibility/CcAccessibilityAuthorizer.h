//
//  CcAccessibilityAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 获取辅助功能权限
@interface CcAccessibilityAuthorizer: NSObject

/// 能够获取已授权、已拒绝的两种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 并不能像其他获取权限方法，还有回调
/// 沙盒模式下，只能返回是否授权
/// 非沙盒模式下，返回是否授权的情况，并且会弹出跳转授权的页面
+ (BOOL)requestAccess;

/// 打开设置中辅助功能添加权限页面
+ (void)openSetting;

@end
