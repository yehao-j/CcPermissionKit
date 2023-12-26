//
//  CcCameraAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import "CcCameraAuthorizer.h"
#import <AVFoundation/AVFoundation.h>
#import <Cocoa/Cocoa.h>

@implementation CcCameraAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
        return CcAuthorizationStatusDenied;
    } else if (status == AVAuthorizationStatusNotDetermined) {
        return CcAuthorizationStatusNotDetermined;
    }
    return CcAuthorizationStatusAuthorized;
}

+ (void)requestAccess:(void (^)(BOOL granted))handler {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        handler(granted);
    }];
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Camera"]];
}

@end
