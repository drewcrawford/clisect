//SearchTests: Search tests
// ©2020 DrewCrawfordApps LLC

import XCTest
@testable import clisectkit

final class SearchTests: XCTestCase {
    func testSearchInt() throws {
        var s = Search(range: 0...5)
        XCTAssertEqual(s.difference,5)
        XCTAssertEqual(s.prompt,2)
        s.apply(result: .isLower)
        XCTAssertEqual(s.range, 3...5)
        XCTAssertEqual(s.prompt,4)
        s.apply(result: .isUpper)
        XCTAssertEqual(s.range, 3...3)
        XCTAssertEqual(s.difference,0)
    }
    
    func testSearchIntDiff() throws {
        var s = Search(range: 12...14)
        XCTAssertEqual(s.difference,2)
        XCTAssertEqual(s.prompt, 13)
        s.apply(result: .isLower)
        XCTAssertEqual(s.range, 14...14)
        XCTAssertEqual(s.difference, 0)

    }
    
   
    static var allTests = [
        ("testSearchInt", testSearchInt),
        ("testSearchIntDiff",testSearchIntDiff),
    ]
}
