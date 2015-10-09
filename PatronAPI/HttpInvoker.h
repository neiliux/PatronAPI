#ifndef HttpInvoker_h
#define HttpInvoker_h

#import "URLRequestFactory.h"

typedef void (^HttpResult)(NSURLResponse *response, NSData *data, NSError *error);

@interface HttpInvoker : NSObject {
@private
    URLRequestFactory *urlRequestFactory;
}

- (instancetype) initWith:(URLRequestFactory *)UrlRequestFactory;
- (void) invokeGet:(NSURL*)url withHeaders:(NSDictionary*)headers resolve:(HttpResult)callback;

@end

#endif /* HttpInvoker_h */
