import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gameoflife_swiftTests.allTests),
    ]
}
#endif
