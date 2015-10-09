#ifndef Drives_h
#define Drives_h

#include "HttpInvoker.h"
#include "TokenManagerFactory.h"
#include "ApiUrlFactory.h"
#include "Drive.h"
#include "MappersProvider.h"

@interface Drives: NSObject {
@private
    HttpInvoker* httpInvoker;
    ApiUrlFactory* apiUrlFactory;
    MappersProvider* mappersProvider;
}

- (instancetype)initWith:(HttpInvoker *)HttpInvoker
       withApiUrlFactory:(ApiUrlFactory *)factor
        withMappersProvider:(MappersProvider *)provider;

- (void)getDrives:(void(^)(NSMutableArray *))drives;
- (void)getDefaultDrive:(void(^)(Drive *))drive;

@end

#endif /* Drives_h */
