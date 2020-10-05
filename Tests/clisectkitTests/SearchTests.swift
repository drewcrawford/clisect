//SearchTests: Search tests
// ©2020 DrewCrawfordApps LLC

import XCTest
@testable import clisectkit

final class SearchTests: XCTestCase {
    func testSearchInt() throws {
        var s = Search(range: 0...5)
        XCTAssertEqual(s.difference,5)
        s.apply(result: .isLower)
        XCTAssertEqual(s.range, 2...5)
        s.apply(result: .isUpper)
        XCTAssertEqual(s.range, 2...3)
        s.apply(result: .isUpper)
        XCTAssertEqual(s.range, 2...2)
        XCTAssertEqual(s.difference, 0)
    }
    
   
    static var allTests = [
        ("testSearchInt", testSearchInt),
    ]
}