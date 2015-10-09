#ifndef Drives_h
#define Drives_h

#include "HttpInvoker.h"
#include "ApiUrlFactory.h"
#include "Drive.h"
#include "MappersProvider.h"
#include "ItemResource.h"

typedef void (^DriveMetadata)(Drive*);
typedef void (^RootFolder)(ItemResource*);
typedef void (^FolderChildren)(NSArray*);
typedef void (^ViewDelta)(id*);
typedef void (^SearchResults)(id*);

@interface Drives: NSObject {
@private
    HttpInvoker* httpInvoker;
    ApiUrlFactory* apiUrlFactory;
    MappersProvider* mappersProvider;
}

- (instancetype)initWith:(HttpInvoker *)HttpInvoker
       withApiUrlFactory:(ApiUrlFactory *)factor
        withMappersProvider:(MappersProvider *)provider;

- (void)getDrives:(void(^)(NSMutableArray *))callback;
- (void)getDefaultDrive:(DriveMetadata)callback;
- (void)getDrive:(NSString*)driveId withCallback:(DriveMetadata)callback;
- (void)getDefaultDriveRootFolder:(RootFolder)callback;
- (void)getDriveRootFolder:(NSString*)driveId withCallback:(RootFolder)callback;
- (void)getDefaultDriveRootChildren:(FolderChildren)callback;
- (void)getDriveRootChildren:(NSString*)driveId withCallback:(FolderChildren)callback;
- (void)getDefaultDriveRootViewDelta:(ViewDelta)callback;
- (void)getDriveRootViewDelta:(NSString*)driveId withCallback:(ViewDelta)callback;
- (void)searchDefaultDrive:(id*)searchToken withCallback:(SearchResults)callback;
- (void)searchDrive:(NSString*)driveId withSearchToken:(id*)serchToken withCallback:(SearchResults)callback;

@end

#endif /* Drives_h */
