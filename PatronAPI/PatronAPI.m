#import <Foundation/Foundation.h>
#import "PatronAPI.h"

@implementation PatronAPI

@synthesize drives;

- (instancetype)initWith:(NSString *)OAuthToken {
    self = [super init];

    if (self) {
        self->tokenManagerFactory = [[TokenManagerFactory alloc] init];
        [self->tokenManagerFactory getManager].token = OAuthToken;
        
        self->urlRquestFactory = [[URLRequestFactory alloc] initWith:self->tokenManagerFactory];

        self->httpInvoker = [[HttpInvoker alloc] initWith:self->urlRquestFactory];
        
        self->apiUrlFactory = [[ApiUrlFactory alloc] init];
        
        self->drives = [[Drives alloc] initWith:self->httpInvoker
                        withApiUrlFactory:apiUrlFactory];
    }
    
    return self;
}

@end