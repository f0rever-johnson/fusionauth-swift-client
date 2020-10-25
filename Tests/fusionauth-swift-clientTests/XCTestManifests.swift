import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(fusionauth_swift_clientTests.allTests),
    ]
}
#endif
