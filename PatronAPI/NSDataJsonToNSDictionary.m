#import <Foundation/Foundation.h>
#import "NSDataJsonToNSDictionary.h"

@implementation NSDataJsonToNSDictionary

- (NSDictionary *)mapToNSDictionary:(NSData *)jsonData {
    // TODO: Handle this scenario.
    if (!NSClassFromString(@"NSJSONSerialization")) {
        [NSException raise:@"No support for NSJSONSerialization" format:@""];
    }
    
    NSError* error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    // TODO: Look into other formats.
    if (![object isKindOfClass:[NSDictionary class]]) {
        [NSException raise:@"Data can not be projected into NSDictionary" format:@""];
    }
    
    return object;
}

@end