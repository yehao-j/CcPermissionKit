//
//  CcPhotoAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 要求macOS10.13及以上，获取相册的权限
/// 沙盒、非沙盒皆可
/// 1、需要在info.plist中添加'Privacy - Photo Library Usage Description'
/// 2、在Signing & Capabilities中勾选'Photos Library'
@interface CcPhotoAuthorizer: NSObject

/// 能够获取未授权、已授权、已拒绝的三种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 请求接入相册权限，会弹出授权弹窗
+ (void)requestAccess:(void (^)(BOOL granted))handler;

/// 打开设置中相册添加权限页面
+ (void)openSetting;

@end
