#ifndef HttpInvoker_h
#define HttpInvoker_h

#import "URLRequestFactory.h"
#import "HttpResult.h"

typedef void (^HttpResponse)(HttpResult*);

@interface HttpInvoker : NSObject {
@private
    URLRequestFactory *urlRequestFactory;
}

- (instancetype) initWith:(URLRequestFactory *)UrlRequestFactory;
- (void) invokeGet:(NSURL*)url withHeaders:(NSDictionary*)headers resolve:(HttpResponse)callback;

@end

#endif /* HttpInvoker_h */
