//
//  CcPermissionKit.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "CcAuthorizationStatus.h"

@interface CcPermissionKit : NSObject

+ (CcAuthorizationStatus)authorizationStatusFor:(CcPermissionType)type;

+ (void)requestAccessFor:(CcPermissionType)type handler:(void (^)(BOOL granted))handler;

+ (void)openSettingFor:(CcPermissionType)type;

@end
