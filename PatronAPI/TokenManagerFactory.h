//
//  TokenManagerFactory.h
//  PatronAPI
//
//  Created by Neil Breeden III on 10/1/15.
//  Copyright (c) 2015 Neil Breeden III. All rights reserved.
//

#ifndef PatronAPI_TokenManagerFactory_h
#define PatronAPI_TokenManagerFactory_h

#import "TokenManager.h"

@interface TokenManagerFactory : NSObject {
@private
    TokenManager *tokenManger;
}

- (TokenManager *)getManager;

@end

#endif
