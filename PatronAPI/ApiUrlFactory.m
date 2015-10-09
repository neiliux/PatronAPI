#import <Foundation/Foundation.h>
#import "ApiUrlFactory.h"

@implementation ApiUrlFactory

- (NSURL *)constructUrl:(NSString *)endpoint {
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", @"https://api.onedrive.com/v1.0", endpoint]];
}

@end