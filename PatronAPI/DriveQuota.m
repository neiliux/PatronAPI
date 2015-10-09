#import "DriveQuota.h"

@implementation DriveQuota

@synthesize deletedSize;
@synthesize remainingSize;
@synthesize state;
@synthesize total;
@synthesize used;

- (instancetype)initWith:(NSString *)stateVal
             withDeleted:(NSNumber *)deletedVal
           withRemaining:(NSNumber *)remainingVal
               withTotal:(NSNumber *)totalVal
                withUsed:(NSNumber *)usedVal {
    
    self = [super init];
    
    if (self) {
        self.state = stateVal;
        self.deletedSize = deletedVal;
        self.remainingSize = remainingVal;
        self.total = totalVal;
        self.used = usedVal;
    }
    
    return self;
}

@end
