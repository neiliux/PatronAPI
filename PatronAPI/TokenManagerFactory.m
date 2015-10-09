//
//  TokenManagerFactory.m
//  PatronAPI
//
//  Created by Neil Breeden III on 10/1/15.
//  Copyright (c) 2015 Neil Breeden III. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TokenManagerFactory.h"
#import "TokenManager.h"

@implementation TokenManagerFactory

- (TokenManager*)getManager
{
    if (self->tokenManger == nil) {
        self->tokenManger = [TokenManager alloc];
    }
    
    return self->tokenManger;
}

@end