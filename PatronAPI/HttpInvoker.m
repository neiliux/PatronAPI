#import <Foundation/Foundation.h>
#include "HttpInvoker.h"
#include "URLRequestFactory.h"
#include "HttpResult.h"

@implementation HttpInvoker

- (instancetype) initWith:(URLRequestFactory *)UrlRequestFactory {
    self = [super init];
    if (self) {
        self->urlRequestFactory = UrlRequestFactory;
    }
    return self;
}

- (void)invokeGet:(NSURL *)url
        withHeaders:(NSDictionary *)headers
        resolve:(HttpResponse)callback {
    
    NSMutableURLRequest* request = [self->urlRequestFactory
                                    CreateRequest:url
                                    withHeaders:headers];
    
    [NSURLConnection sendAsynchronousRequest:request
                    queue: [NSOperationQueue mainQueue]
                    completionHandler: ^(NSURLResponse * _Nullable response,
                                         NSData * _Nullable data,
                                         NSError * _Nullable connectionError) {
                        
                        HttpResult *result = [[HttpResult alloc] init];
                        
                        if (connectionError != nil) {
                            result.hasError = true;
                            result.error = connectionError;
                        } else {
                            result.hasError = false;
                            result.error = nil;
                        }
                        
                        result.data = data;
                        result.response = response;
                        
                        callback(result);
                    }
     ];
}

@end