#ifndef ApiUrlFactory_h
#define ApiUrlFactory_h

#import <Foundation/Foundation.h>

@interface ApiUrlFactory : NSObject

- (NSURL *) constructUrl:(NSString *)endpoint;

@end

#endif /* ApiUrlFactory_h */
