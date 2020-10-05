import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ParseableRangeTests.allTests),
        testCase(SearchTests.allTests),
    ]
}
#endif
