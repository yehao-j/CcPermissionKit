//
//  CcPhotoAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import "CcPhotoAuthorizer.h"
#import <Cocoa/Cocoa.h>
@import Photos;

@implementation CcPhotoAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusLimited) {
        return CcAuthorizationStatusDenied;
    } else if (status == PHAuthorizationStatusNotDetermined) {
        return CcAuthorizationStatusNotDetermined;
    }
    return CcAuthorizationStatusAuthorized;
}

+ (void)requestAccess:(void (^)(BOOL granted))handler {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        handler(status == PHAuthorizationStatusAuthorized);
    }];
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Photos"]];
}

@end
