import XCTest

import GameOfLifeTests

var tests = [XCTestCaseEntry]()
tests += GameOfLifeTests.allTests()
XCTMain(tests)
