//
//  CcContactAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 要求macOS10.11及以上，获取通讯录的权限
/// 沙盒、非沙盒皆可
/// 1、需要在info.plist中添加'Privacy - Contacts Usage Description'
/// 2、在Signing & Capabilities中勾选'Contacts'
@interface CcContactAuthorizer: NSObject

/// 能够获取未授权、已授权、已拒绝的三种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 请求接入通讯录权限，会弹出授权弹窗
+ (void)requestAccess:(void (^)(BOOL granted))handler;

/// 打开设置中通讯录添加权限页面
+ (void)openSetting;

@end
