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
        
        NSDataJsonToNSDictionary *jsonToDictionary = [[NSDataJsonToNSDictionary alloc] init];
        self->mappersProvider = [[MappersProvider alloc] initWith:jsonToDictionary];
        
        self->drives = [[Drives alloc] initWith:self->httpInvoker
                        withApiUrlFactory:apiUrlFactory
                        withMappersProvider:self->mappersProvider];
    }
    
    return self;
}

@end