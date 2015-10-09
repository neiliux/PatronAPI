#import <Foundation/Foundation.h>
#import "Drive.h"
#import "User.h"
#import "DriveQuota.h"
#import "NSDataJsonToNSDictionary.h"

@interface MappersProvider : NSObject

-(instancetype)initWith:(NSDataJsonToNSDictionary*)jsonToDictionary;

-(Drive*)mapToDrive:(NSData *)jsonData;

-(User*)mapToUser:(NSDictionary*)user;
-(DriveQuota*)mapToDriveQuota:(NSDictionary*)driveQuota;

@end
