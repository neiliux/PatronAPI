#import <Foundation/Foundation.h>
#import "Drives.h"
#import "HttpInvoker.h"
#import "TokenManagerFactory.h"
#import "ApiUrlFactory.h"
#import "Drive.h"
#import "User.h"
#import "DriveQuota.h"
#import "MappersProvider.h"

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
    
    //[self->httpInvoker invokeGet:[self->apiUrlFactory constructUrl:@"drives"]
    //                 withHeaders:nil
    //                resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
    //                         NSLog(@"ran");
    //                         NSString *s = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    //                         NSLog(s);
                             
    //                         drives(nil);
    //                }
    // ];
}

- (void)getDefaultDrive:(void (^)(Drive *))callback {
    [self->httpInvoker invokeGet:[self->apiUrlFactory constructUrl:@"drive"]
                        withHeaders:nil
                         resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                             // TODO: Add error handling.
                             Drive* drive = [self->mappersProvider mapToDrive:data];
                             callback(drive);
                         }
     
     ];
}

@end