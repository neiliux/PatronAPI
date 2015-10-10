#import <Foundation/Foundation.h>
#import "Drives.h"
#import "HttpInvoker.h"
#import "ApiUrlFactory.h"
#import "Drive.h"
#import "MappersProvider.h"
#import "ItemResource.h"
#import "ItemResourceChildren.h"
#import "HTTPResult.h"

@implementation Drives

- (instancetype)initWith:(HttpInvoker *)HttpInvoker
       withApiUrlFactory:(ApiUrlFactory *)factory
     withMappersProvider:(MappersProvider *)provider {
    
    self = [super init];
    
    if (self) {
        self->httpInvoker = HttpInvoker;
        self->apiUrlFactory = factory;
        self->mappersProvider = provider;
    }
    
    return self;
}

- (void)getDrives:(void (^)(NSMutableArray *))drives {
    [NSException raise:@"not implemented" format:@""];
}

- (void)getDefaultDrive:(DriveMetadata)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory constructUrl:@"drive"]
                     withHeaders:nil
                         resolve: ^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"gtDefaultDrive ERROR, handle");
                                 return;
                             }
                             
                             Drive* drive = [self->mappersProvider mapToDrive:result.data];
                             callback(drive);
                         }
     
     ];
}

- (void)getDrive:(NSString*)driveId withCallback:(DriveMetadata)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:[NSString stringWithFormat:@"drives/%@", driveId]]
                     withHeaders:nil
                         resolve: ^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"getDrive ERROR, handle");
                                 return;
                             }
                             
                             Drive* mappedDrive = [self->mappersProvider mapToDrive:result.data];
                             callback(mappedDrive);
                         }
     ];
}

- (void)getDefaultDriveRootFolder:(RootFolder)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:@"drive/root"]
                     withHeaders:nil
                         resolve: ^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"getDefaultDriveRootFolder ERROR, handle");
                                 return;
                             }
                             
                             ItemResource* resource = [self->mappersProvider mapToItemResource:result.data];
                             callback(resource);
                         }
     ];
    
}

- (void)getDriveRootFolder:(NSString*)driveId withCallback:(RootFolder)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:[NSString stringWithFormat:@"drives/%@/root", driveId]]
                     withHeaders:nil
                         resolve: ^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"getDriveRootFolder ERROR, handle");
                                 return;
                             }
                             
                             ItemResource* resource = [self->mappersProvider mapToItemResource:result.data];
                             callback(resource);
                         }
     ];
    
}

- (void)getDefaultDriveRootChildren:(FolderChildren)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:@"drive/root/children"]
                     withHeaders:nil
                         resolve:^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"getDefaultDriveRootChildren ERROR, handle");
                                 return;
                             }
                             
                             ItemResourceChildren* children = [self->mappersProvider mapToItemResourceChildren:result.data];
                             callback(children);
                         }
     ];
}

- (void)getDriveRootChildren:(NSString*)driveId withCallback:(FolderChildren)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:[NSString stringWithFormat:@"drives/%@/root/children", driveId]]
                     withHeaders:nil
                         resolve:^(HttpResult* result) {
                             if (result.hasError) {
                                 NSLog(@"getDriveRootChildren ERROR, handle");
                                 return;
                             }
                             
                             ItemResourceChildren* children = [self->mappersProvider mapToItemResourceChildren:result.data];
                             callback(children);
                         }
     ];
}

- (void)getDefaultDriveRootViewDelta:(ViewDelta)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)getDriveRootViewDelta:(NSString*)driveId withCallback:(ViewDelta)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)searchDefaultDrive:(id*)searchToken withCallback:(SearchResults)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)searchDrive:(NSString*)driveId withSearchToken:(id*)serchToken withCallback:(SearchResults)callback {
    [NSException raise:@"not implemented" format:@""];
}

@end