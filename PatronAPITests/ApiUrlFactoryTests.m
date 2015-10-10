#import <Foundation/Foundation.h>
#import "XCTest/XCTest.h"
#import "../PatronAPI/ApiUrlFactory.h"

@interface ApiUrlFactoryTests : XCTestCase {
    ApiUrlFactory* apiUrlFactory;
}
@end

@implementation ApiUrlFactoryTests

- (void)setUp {
    [super setUp];
    self->apiUrlFactory = [[ApiUrlFactory alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void) test_constructUrl_should_generate_the_expected_url {
    NSURL* result = [self->apiUrlFactory constructUrl:@"mock_url_endpoint"];
    BOOL isExpected = [[result absoluteString] isEqualToString:@"https://api.onedrive.com/v1.0/mock_url_endpoint"];
    XCTAssert(isExpected, @"Generated URL is incorrect");
}

@end