#import <Foundation/Foundation.h>

@interface HttpResult : NSObject

@property BOOL hasError;
@property NSError* error;
@property NSData* data;
@property NSURLResponse* response;

@end
