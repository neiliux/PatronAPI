#import <Cocoa/Cocoa.h>

//! Project version number for PatronAPI.
FOUNDATION_EXPORT double PatronAPIVersionNumber;

//! Project version string for PatronAPI.
FOUNDATION_EXPORT const unsigned char PatronAPIVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PatronAPI/PublicHeader.h>
#import "TokenManager.h"
#import "TokenManagerFactory.h"
#import "HttpInvoker.h"
#import "URLRequestFactory.h"
#import "Drives.h"
#import "ApiUrlFactory.h"
#import "DriveQuota.h"
#import "NSDataJsonToNSDictionary.h"
#import "User.h"
#import "MappersProvider.h"

@interface PatronAPI : NSObject {
@private
    TokenManagerFactory* tokenManagerFactory;
    URLRequestFactory* urlRquestFactory;
    HttpInvoker* httpInvoker;
    ApiUrlFactory* apiUrlFactory;
    MappersProvider* mappersProvider;
}

@property (readonly) Drives* drives;

- (instancetype) initWith:(NSString *)OAuthToken;

@end