#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "../../PatronAPI/TokenManager.h"

@interface TokenManagerTests : XCTestCase {
    TokenManager *tokenManager;
}
@end

@implementation TokenManagerTests

- (void)setUp {
    [super setUp];
    self->tokenManager = [TokenManager alloc];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_token_should_be_nil_if_never_set {
    XCTAssert(self->tokenManager.token == nil, "token is not nil");
}

- (void)test_should_allow_setting_of_token {
    self->tokenManager.token = @"mock-token";
}

- (void)test_should_return_previously_set_token {
    self->tokenManager.token = @"mock-token";
    Boolean result = [self->tokenManager.token isEqual:@"mock-token"];
    
    XCTAssertTrue(result, "token is not expected value");
}

@end
