#ifndef Drives_h
#define Drives_h

#include "HttpInvoker.h"
#include "TokenManagerFactory.h"
#include "ApiUrlFactory.h"

@interface IDrive : NSObject {
    NSString *id;
}
@end

@interface Drives: NSObject {
@private
    HttpInvoker* httpInvoker;
    ApiUrlFactory* apiUrlFactory;
}

- (instancetype)initWith:(HttpInvoker *)HttpInvoker withApiUrlFactory:(ApiUrlFactory *)factor;
- (void)getDrives:(void(^)(NSMutableArray *))drives;
- (void)getDefaultDrive:(void(^)(IDrive *))drive;

@end

#endif /* Drives_h */
