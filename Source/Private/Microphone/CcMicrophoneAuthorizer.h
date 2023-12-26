//
//  CcMicrophoneAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 要求macOS10.14及以上，要获取相应的权限
/// 沙盒、非沙盒皆可
/// 1、需要在info.plist中添加'Privacy - Microphone Usage Description'
/// 2、在Signing & Capabilities中勾选'Audio Input'
@interface CcMicrophoneAuthorizer: NSObject

/// 能够获取未授权、已授权、已拒绝的三种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 请求接入麦克风权限，会弹出授权弹窗
+ (void)requestAccess:(void (^)(BOOL granted))handler;

/// 打开设置中麦克风添加权限页面
+ (void)openSetting;

@end
