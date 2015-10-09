#import <Foundation/Foundation.h>
#import "Drives.h"
#import "HttpInvoker.h"
#import "ApiUrlFactory.h"
#import "Drive.h"
#import "MappersProvider.h"
#import "ItemResource.h"

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
                        resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                            // TODO: Add error handling.
                            Drive* drive = [self->mappersProvider mapToDrive:data];
                            callback(drive);
                        }
     
     ];
}

- (void)getDrive:(NSString*)driveId withCallback:(DriveMetadata)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:[NSString stringWithFormat:@"drives/%@", driveId]]
                    withHeaders:nil
                    resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                        // TODO: Add error handling.
                        Drive* mappedDrive = [self->mappersProvider mapToDrive:data];
                        callback(mappedDrive);
                    }
     ];
}

- (void)getDefaultDriveRootFolder:(RootFolder)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:@"drive/root"]
                     withHeaders:nil
                     resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                         // TODO: Add error handling.
                         ItemResource* resource = [self->mappersProvider mapToItemResource:data];
                         callback(resource);
                     }
     ];

}

- (void)getDriveRootFolder:(NSString*)driveId withCallback:(RootFolder)callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory
                                  constructUrl:[NSString stringWithFormat:@"drives/%@/root", driveId]]
                        withHeaders:nil
                        resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                            // TODO: Add error handling.
                            ItemResource* resource = [self->mappersProvider mapToItemResource:data];
                            callback(resource);
                        }
     ];

}

- (void)getDefaultDriveRootChildren:(FolderChildren)callback {
}

- (void)getDriveRootChildren:(NSString*)driveId withCallback:(FolderChildren)callback {
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