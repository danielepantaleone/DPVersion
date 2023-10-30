//
//  DPVersionExpressibleByStringLiteralTests.swift
//  DPVersion
//
//  Created by Daniele Pantaleone
//    - Github: https://github.com/danielepantaleone
//    - LinkedIn: https://www.linkedin.com/in/danielepantaleone
//
//  Copyright © 2023 Daniele Pantaleone. Licensed under MIT License.
//

import XCTest

@testable import DPVersion

class DPVersionExpressibleByStringLiteralTests: XCTestCase {
    
    func testEqualityInAlphaLiteralInit() {
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a5"), DPVersion(stringLiteral: "1.0.0alpha5"))
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a5"), DPVersion(stringLiteral: "1.0.0alpha.5"))
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a5"), DPVersion(stringLiteral: "1.0.0-alpha5"))
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a5"), DPVersion(stringLiteral: "1.0.0-alpha.5"))
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a05"), DPVersion(stringLiteral: "1.0.0-a05"))
        XCTAssertEqual(DPVersion(stringLiteral: "1.0a05"), DPVersion(stringLiteral: "1.0.0-a.05"))
    }
    
    func testEqualityInBetaLiteralInit() {
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta4"), DPVersion(stringLiteral: "3.0.1b4"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta.4"), DPVersion(stringLiteral: "3.0.1b4"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta.4"), DPVersion(stringLiteral: "3.0.1b.4"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta4"), DPVersion(stringLiteral: "3.0.1-beta4"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta4"), DPVersion(stringLiteral: "3.0.1-beta.4"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta4"), DPVersion(stringLiteral: "3.0.1-beta04"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta4"), DPVersion(stringLiteral: "3.0.1-beta.04"))
        XCTAssertEqual(DPVersion(stringLiteral: "3.0.1beta.4"), DPVersion(stringLiteral: "3.0.1-beta.04"))
    }
    
    func testEqualityInDevLiteralInit() {
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4dev5"), DPVersion(stringLiteral: "2.1.4-dev5"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4dev05"), DPVersion(stringLiteral: "2.1.4-dev5"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4dev05"), DPVersion(stringLiteral: "2.1.4-dev.5"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4dev5"), DPVersion(stringLiteral: "2.1.4-dev05"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4dev5"), DPVersion(stringLiteral: "2.1.4-dev.05"))
    }
    
    func testEqualityInRcLiteralInit() {
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4rc5"), DPVersion(stringLiteral: "2.1.4-rc5"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4rc05"), DPVersion(stringLiteral: "2.1.4-rc5"))
        XCTAssertEqual(DPVersion(stringLiteral: "2.1.4rc5"), DPVersion(stringLiteral: "2.1.4-rc05"))
    }
    
    func testEqualityInStableLiteralInit() {
        XCTAssertEqual(DPVersion(stringLiteral: "02.17.01"), DPVersion(stringLiteral: "2.17.1"))
        XCTAssertEqual(DPVersion(stringLiteral: "02.00"), DPVersion(stringLiteral: "2.0"))
    }
    
}
