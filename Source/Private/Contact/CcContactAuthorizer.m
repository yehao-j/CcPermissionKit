//
//  CcContactAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/21.
//

#import "CcContactAuthorizer.h"
#import <Cocoa/Cocoa.h>
@import Contacts;

@implementation CcContactAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    CNAuthorizationStatus status = [self authorizationStatusForEntityType:CNEntityTypeContacts];

    if (status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted) {
        return CcAuthorizationStatusDenied;
    } else if (status == CNAuthorizationStatusNotDetermined) {
        return CcAuthorizationStatusNotDetermined;
    }
    return CcAuthorizationStatusAuthorized;
}

+ (void)requestAccess:(void (^)(BOOL granted))handler {
    CNContactStore *store = [CNContactStore new];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        handler(granted);
    }];
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Contacts"]];
}

+ (CNAuthorizationStatus)authorizationStatusForEntityType:(CNEntityType)entityType {
    id authorization = NSClassFromString(@"CNAuthorization");
    if ([authorization respondsToSelector:@selector(authorizationStatusForEntityType:)]) {
        return [authorization authorizationStatusForEntityType:entityType];
    } else {
        return [CNContactStore authorizationStatusForEntityType:entityType];
    }
}

@end
