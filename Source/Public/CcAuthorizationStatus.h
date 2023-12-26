//
//  CcAuthorizationStatus.h
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#ifndef CcAuthorizationStatus_h
#define CcAuthorizationStatus_h

typedef NS_ENUM(NSUInteger, CcAuthorizationStatus) {
    CcAuthorizationStatusNotDetermined,
    CcAuthorizationStatusDenied,
    CcAuthorizationStatusAuthorized
};

typedef NS_ENUM(NSUInteger, CcPermissionType) {
    CcPermissionTypeCalendar = 0,
    CcPermissionTypeReminder,
    CcPermissionTypeContact,
    CcPermissionTypePhoto,
    CcPermissionTypeCamera,
    CcPermissionTypeAllFiles,
    CcPermissionTypeMicrophone,
    CcPermissionTypeScreenCapture,
    CcPermissionTypeAccessibility
};

#endif /* CcAuthorizationStatus_h */
