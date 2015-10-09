#import <Foundation/Foundation.h>
#import "Drives.h"
#import "HttpInvoker.h"
#import "TokenManagerFactory.h"
#import "ApiUrlFactory.h"

@implementation Drives

- (instancetype)initWith:(HttpInvoker *)HttpInvoker
       withApiUrlFactory:(ApiUrlFactory *)factory {
    
    self = [super init];
    
    if (self) {
        self->httpInvoker = HttpInvoker;
        self->apiUrlFactory = factory;
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

- (void)getDefaultDrive:(void (^)(IDrive *))drive {
    [self->httpInvoker invokeGet:[self->apiUrlFactory constructUrl:@"drive"]
                        withHeaders:nil
                         resolve: ^(NSURLResponse *response, NSData *data, NSError *error) {
                             NSLog(@"ran");
                             NSString *s = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                             NSLog(s);
                             
                             drive(nil);
                         }
     
     ];
}

@end