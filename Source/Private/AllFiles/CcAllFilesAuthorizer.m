//
//  CcAllFilesAuthorizer.m
//  CcPermissionKit
//
//  Created by niko on 2023/11/22.
//

#import "CcAllFilesAuthorizer.h"
#import <pwd.h>
#import <Cocoa/Cocoa.h>

@implementation CcAllFilesAuthorizer

+ (NSString *)userHomeFolderPath {
    NSString *userHomeFolderPath = nil;
    BOOL isSandboxed = NSProcessInfo.processInfo.environment[@"APP_SANDBOX_CONTAINER_ID"] != nil;
    if (isSandboxed) {
        struct passwd *pw = getpwuid(getuid());
        assert(pw);
        userHomeFolderPath = [NSString stringWithUTF8String:pw->pw_dir];
    } else {
        userHomeFolderPath = NSHomeDirectory();
    }
    return userHomeFolderPath;
}

+ (CcAuthorizationStatus)authorizationStatus {
    NSArray *testFiles = @[[self.userHomeFolderPath stringByAppendingPathComponent:@"Library/Safari/CloudTabs.db"], [self.userHomeFolderPath stringByAppendingPathComponent:@"Library/Safari/Bookmarks.plist"], @"/Library/Preferences/com.apple.TimeMachine.plist"];

    BOOL fileExists = NO;
    NSData *data = nil;
    for (NSString *file in testFiles) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:file]) {
            fileExists = YES;
            data = [NSData dataWithContentsOfFile:file];
            if (data != nil) {
                break;
            }
        }
    }
    
    if (data == nil && fileExists) {
        return CcAuthorizationStatusDenied;
    } else if (fileExists) {
        return CcAuthorizationStatusAuthorized;
    } else {
        return CcAuthorizationStatusDenied;
    }
}

+ (void)requestAccess {
    [self openSetting];
}

+ (void)openSetting {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"]];
}

@end
