//
//  CcCalendarAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import "CcCalendarAuthorizer.h"
#import <Cocoa/Cocoa.h>
@import EventKit;

@implementation CcCalendarAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status == EKAuthorizationStatusDenied || status == EKAuthorizationStatusRestricted) {
        return CcAuthorizationStatusDenied;
    } else if (status == EKAuthorizationStatusNotDetermined) {
        return CcAuthorizationStatusNotDetermined;
    }
    return CcAuthorizationStatusAuthorized;
}

+ (void)requestAccess:(void (^)(BOOL granted))handler {
    EKEventStore *store = [EKEventStore new];
    if (@available(macOS 14.0, *)) {
        [store requestFullAccessToEventsWithCompletion:^(BOOL granted, NSError * _Nullable error) {
            handler(granted);
        }];
    } else {
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
            handler(granted);
        }];
    }
    
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Calendars"]];
}

@end
