#import <Foundation/Foundation.h>

@interface DriveQuota : NSObject

@property () NSNumber* deletedSize;
@property () NSNumber* remainingSize;
@property () NSString* state;
@property () NSNumber* total;
@property () NSNumber* used;

- (instancetype)initWith:(NSString*)stateVal
             withDeleted:(NSNumber*)deletedVal
           withRemaining:(NSNumber*)remainingVal
               withTotal:(NSNumber*)totalVal
                withUsed:(NSNumber*)usedVal;

@end
