//
//  CcAllFilesAuthorizer.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

@interface CcAllFilesAuthorizer: NSObject

/// 能够获取已授权、已拒绝的两种状态
/// 在沙盒模式下，需要添加'com.apple.security.temporary-exception.files.absolute-path.read-write'='/'，或者直接是非沙盒模式下，才能正确的判断是否已经授权
+ (CcAuthorizationStatus)authorizationStatus;

+ (void)requestAccess;

/// 打开设置中完全磁盘添加权限页面
+ (void)openSetting;

@end
