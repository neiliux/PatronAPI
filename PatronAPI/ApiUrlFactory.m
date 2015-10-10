#import <Foundation/Foundation.h>
#import "ApiUrlFactory.h"

@implementation ApiUrlFactory

- (NSURL *)constructUrl:(NSString *)endpoint {
    // TODO: Refactor to use relativeToUrl
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", @"https://api.onedrive.com/v1.0", endpoint]];
}

@end