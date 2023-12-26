//
//  CcScreenCaptureAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 要求macOS10.15及以上，获取录屏权限
@interface CcScreenCaptureAuthorizer: NSObject

/// 能够获取已授权、已拒绝的两种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 并不能像其他获取权限方法，还有回调
/// 沙盒或者非沙盒模式下，都能弹出跳转授权的页面，并且只能返回是否授权
+ (BOOL)requestAccess;

/// 打开设置中录屏添加权限页面
+ (void)openSetting;

@end
