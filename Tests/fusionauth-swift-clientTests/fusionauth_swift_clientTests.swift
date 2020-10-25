import XCTest
@testable import fusionauth_swift_client

final class fusionauth_swift_clientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(fusionauth_swift_client().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
