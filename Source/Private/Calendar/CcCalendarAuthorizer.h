//
//  CcCalendarAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

/// 获取日历权限
@interface CcCalendarAuthorizer: NSObject

/// 能够获取未授权、已授权、已拒绝的三种状态
+ (CcAuthorizationStatus)authorizationStatus;

/// 请求接入相册权限，会弹出授权弹窗
+ (void)requestAccess:(void (^)(BOOL granted))handler;

/// 打开设置中相册添加权限页面
+ (void)openSetting;

@end
