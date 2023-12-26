//
//  CcScreenCaptureAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import "CcScreenCaptureAuthorizer.h"
#import <ScreenCaptureKit/ScreenCaptureKit.h>

@implementation CcScreenCaptureAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    return CGPreflightScreenCaptureAccess() ? CcAuthorizationStatusAuthorized : CcAuthorizationStatusDenied;
}

+ (BOOL)requestAccess {
    return CGRequestScreenCaptureAccess();
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture"]];
}

@end
