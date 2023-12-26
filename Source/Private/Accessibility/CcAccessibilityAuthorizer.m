//
//  CcAccessibilityAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import "CcAccessibilityAuthorizer.h"
#import <ApplicationServices/ApplicationServices.h>
#import <Cocoa/Cocoa.h>

@implementation CcAccessibilityAuthorizer

+ (CcAuthorizationStatus)authorizationStatus {
    return AXIsProcessTrusted() ? CcAuthorizationStatusAuthorized : CcAuthorizationStatusDenied;
}

+ (BOOL)requestAccess {
    BOOL isTrusted = AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef) @{(__bridge NSString *)kAXTrustedCheckOptionPrompt: @YES});
    return isTrusted;
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"]];
}

@end
