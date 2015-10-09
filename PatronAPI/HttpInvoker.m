#import <Foundation/Foundation.h>
#include "HttpInvoker.h"
#include "URLRequestFactory.h"

@implementation HttpInvoker

- (instancetype) initWith:(URLRequestFactory *)UrlRequestFactory {
    self = [super init];
    if (self) {
        self->urlRequestFactory = UrlRequestFactory;
    }
    return self;
}

- (void) invokeGet:(NSURL *)url
                    withHeaders:(NSDictionary *)headers
                    resolve:(HttpResult)callback {
    
    NSMutableURLRequest* request = [self->urlRequestFactory
                                    CreateRequest:url
                                    withHeaders:headers];
    
    [NSURLConnection sendAsynchronousRequest:request
                    queue: [NSOperationQueue mainQueue]
                    completionHandler: ^(NSURLResponse * _Nullable response,
                                         NSData * _Nullable data,
                                         NSError * _Nullable connectionError) {
                        callback(response, data, connectionError);
                    }
     ];
}

@end