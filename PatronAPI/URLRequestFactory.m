#import <Foundation/Foundation.h>
#import "URLRequestFactory.h"
#import "TokenManagerFactory.h"

@implementation URLRequestFactory

- (instancetype)initWith:(TokenManagerFactory *)TokenManagerFactory {
    self = [super init];
    
    if (self) {
        self->tokenManagerFactory = TokenManagerFactory;
    }
    
    return self;
}

- (NSMutableURLRequest *)CreateRequest:(NSURL *)url
                           withHeaders:(NSDictionary *)headers {
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: url];
    
    // Let's add the OAuth header automatically. Users can override it via the
    // passed headers dictionary, if necessary.
    if (self->tokenManagerFactory != nil) {
        [request setValue:[[self->tokenManagerFactory getManager] token]
                    forHTTPHeaderField:@"Authorization"];
    }
    
    if (headers != nil) {
        for (NSString* key in [headers allKeys]) {
            [request setValue:[headers objectForKey:key]
                        forHTTPHeaderField:key];
        }
    }

    return request;
}

@end