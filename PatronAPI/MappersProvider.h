#import <Foundation/Foundation.h>
#import "Drive.h"
#import "User.h"
#import "DriveQuota.h"
#import "NSDataJsonToNSDictionary.h"
#import "ItemResource.h"
#import "ItemResourceChildren.h"

@interface MappersProvider : NSObject

-(instancetype)initWith:(NSDataJsonToNSDictionary*)jsonToDictionary;

-(Drive*)mapToDrive:(NSData *)jsonData;
-(ItemResource*)mapToItemResource:(NSData *)jsonData;
-(ItemResourceChildren*)mapToItemResourceChildren:(NSData *)jsonData;

-(User*)mapToUser:(NSDictionary*)user;
-(DriveQuota*)mapToDriveQuota:(NSDictionary*)driveQuota;
-(LastModifiedBy*)mapToLastModifiedBy:(NSDictionary*)lastModifiedData;
-(Folder*)mapToFolder:(NSDictionary*)folderData;
-(FileSystemInfo*)mapToFileSystemInfo:(NSDictionary*)fileSystemInfoData;
-(ParentReference*)mapToParentReference:(NSDictionary*)parentReferenceData;
-(ItemResource*)mapDictionaryToItemResource:(NSDictionary *)itemData;

@end
