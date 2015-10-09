#ifndef URLRequestFactory_h
#define URLRequestFactory_h

#import <Foundation/Foundation.h>
#import "TokenManagerFactory.h"

@interface URLRequestFactory : NSObject {
    
@private
    TokenManagerFactory* tokenManagerFactory;
}

- (instancetype)initWith:(TokenManagerFactory *)TokenManagerFactory;
- (NSMutableURLRequest *)CreateRequest:(NSURL *)url withHeaders:(NSDictionary *)headers;

@end

#endif /* URLRequestFactory_h */
