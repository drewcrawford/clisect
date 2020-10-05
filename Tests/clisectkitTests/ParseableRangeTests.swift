//ParseableRangeTests: Parseable range tests
// ©2020 DrewCrawfordApps LLC

import XCTest
@testable import clisectkit

final class ParseableRangeTests: XCTestCase {
    func testParse() throws {
        let f = try ClosedRange<Double>(parsing: "123...150")
        XCTAssertEqual(f.lowerBound, 123)
        XCTAssertEqual(f.upperBound, 150)
    }
    
    func testParseInt() throws {
        let f = try ClosedRange<Int>(parsing: "123...150")
        XCTAssertEqual(f.lowerBound, 123)
        XCTAssertEqual(f.upperBound, 150)
    }
    
   
    static var allTests = [
        ("testParse", testParse),
        ("testParseInt",testParseInt),
    ]
}
