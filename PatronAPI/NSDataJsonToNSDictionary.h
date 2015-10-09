#ifndef NSDataJsonToNSDictionary_h
#define NSDataJsonToNSDictionary_h

#import <Foundation/Foundation.h>

@interface NSDataJsonToNSDictionary : NSObject

- (NSDictionary *)mapToNSDictionary:(NSData *)jsonData;

@end

#endif /* NSDataJsonToNSDictionary_h */
