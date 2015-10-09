#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "../../PatronAPI/TokenManagerFactory.h"
#import "../../PatronAPI/TokenManager.h"

@interface TokenManagerFactoryTests : XCTestCase {
    TokenManagerFactory *tokenManagerFactory;
}
@end

@implementation TokenManagerFactoryTests

- (void)setUp {
    [super setUp];
    self->tokenManagerFactory = [TokenManagerFactory alloc];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_getManager_returns_tokenManager_instance {
    TokenManager *tokenManager = [self->tokenManagerFactory getManager];
    XCTAssertNotNil(tokenManager, "tokenManager is nil");
}

- (void)test_getManager_returns_singleton_instance_of_tokenManager {
    TokenManager *manager1 = [self->tokenManagerFactory getManager];
    TokenManager *manager2 = [self->tokenManagerFactory getManager];
    
    XCTAssert(manager1 == manager2, "tokenManagerFactory is not returning a singleton instance of TokenManager");
}

@end
