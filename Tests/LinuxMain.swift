import XCTest

import clisectTests
import clisectkitTests

var tests = [XCTestCaseEntry]()
tests += clisectTests.allTests()
tests += clisectkitTests.allTests()
XCTMain(tests)
