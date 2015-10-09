#import <Foundation/Foundation.h>
#import "User.h"
#import "DriveQuota.h"

@interface Drive : NSObject

@property () NSString* odataContext;
@property () NSString* id;
@property () NSString* driveType;
@property () User* owner;
@property () DriveQuota* quota;

@end
