#import <Foundation/Foundation.h>
#import "User.h"
#import "ParentReference.h"
#import "Folder.h"
#import "LastModifiedBy.h"
#import "FileSystemInfo.h"

@interface ItemResource : NSObject

@property () NSString* odataContext;
@property () NSString* id;
@property () NSString* name;
@property () NSString* eTag;
@property () NSString *cTag;
@property () User* createdBy;
@property () NSDate* createdDateTime;
@property () LastModifiedBy* lastModifiedBy;
@property () NSDate *lastModifiedDateTime;
@property () NSNumber* size;
@property () NSString* webUrl;
@property () ParentReference* parentReference;
@property () Folder* folder;
@property () FileSystemInfo* fileSystemInfo;

@end
