//
//  CcPermissionKit.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import "CcPermissionKit.h"
#import "CcPhotoAuthorizer.h"
#import "CcCameraAuthorizer.h"
#import "CcContactAuthorizer.h"
#import "CcCalendarAuthorizer.h"
#import "CcAllFilesAuthorizer.h"
#import "CcReminderAuthorizer.h"
#import "CcAccessibilityAuthorizer.h"
#import "CcMicrophoneAuthorizer.h"
#import "CcScreenCaptureAuthorizer.h"

@implementation CcPermissionKit

+ (CcAuthorizationStatus)authorizationStatusFor:(CcPermissionType)type {
    switch (type) {
        case CcPermissionTypePhoto:
            return [CcPhotoAuthorizer authorizationStatus];
        case CcPermissionTypeCamera:
            return [CcCameraAuthorizer authorizationStatus];
        case CcPermissionTypeContact:
            return [CcContactAuthorizer authorizationStatus];
        case CcPermissionTypeCalendar:
            return [CcCalendarAuthorizer authorizationStatus];
        case CcPermissionTypeReminder:
            return [CcReminderAuthorizer authorizationStatus];
        case CcPermissionTypeMicrophone:
            return [CcMicrophoneAuthorizer authorizationStatus];
        case CcPermissionTypeAccessibility:
            return [CcAccessibilityAuthorizer authorizationStatus];
        case CcPermissionTypeAllFiles:
            return [CcAllFilesAuthorizer authorizationStatus];
        case CcPermissionTypeScreenCapture:
            return [CcScreenCaptureAuthorizer authorizationStatus];
    }
    return CcAuthorizationStatusDenied;
}

+ (void)requestAccessFor:(CcPermissionType)type handler:(void (^)(BOOL granted))handler {
    switch (type) {
        case CcPermissionTypePhoto:
            [CcPhotoAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeCamera:
            [CcCameraAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeContact:
            [CcContactAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeCalendar:
            [CcCalendarAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeReminder:
            [CcReminderAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeMicrophone:
            [CcMicrophoneAuthorizer requestAccess:handler];
            break;
        case CcPermissionTypeAccessibility:
            [CcAccessibilityAuthorizer requestAccess];
            break;
        case CcPermissionTypeAllFiles:
            [CcAllFilesAuthorizer requestAccess];
            break;
        case CcPermissionTypeScreenCapture:
            [CcScreenCaptureAuthorizer requestAccess];
            break;
    }
}

+ (void)openSettingFor:(CcPermissionType)type {
    switch (type) {
        case CcPermissionTypePhoto:
            [CcPhotoAuthorizer openSetting];
            break;
        case CcPermissionTypeCamera:
            [CcCameraAuthorizer openSetting];
            break;
        case CcPermissionTypeContact:
            [CcContactAuthorizer openSetting];
            break;
        case CcPermissionTypeCalendar:
            [CcCalendarAuthorizer openSetting];
            break;
        case CcPermissionTypeReminder:
            [CcReminderAuthorizer openSetting];
            break;
        case CcPermissionTypeMicrophone:
            [CcMicrophoneAuthorizer openSetting];
            break;
        case CcPermissionTypeAccessibility:
            [CcAccessibilityAuthorizer openSetting];
            break;
        case CcPermissionTypeAllFiles:
            [CcAllFilesAuthorizer openSetting];
            break;
        case CcPermissionTypeScreenCapture:
            [CcScreenCaptureAuthorizer openSetting];
            break;
    }
}

@end
