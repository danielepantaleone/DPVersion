//
//  DPVersionCustomStringConvertibleTests.swift
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

class DPVersionCustomStringConvertibleTests: XCTestCase {
    
    func testDescriptionStable() {
        let v: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        XCTAssertEqual(v.description, "1.3.2")
    }
    
    func testDescriptionAlpha() {
        let v: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, alpha: 4)
        XCTAssertEqual(v.description, "1.3.2-alpha4")
    }
    
    func testDescriptionBeta() {
        let v: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, beta: 1)
        XCTAssertEqual(v.description, "1.3.2-beta1")
    }
    
    func testDescriptionDev() {
        let v: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, dev: 8)
        XCTAssertEqual(v.description, "1.3.2-dev8")
    }
    
    func testDescriptionRc() {
        let v: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, rc: 2)
        XCTAssertEqual(v.description, "1.3.2-rc2")
    }
    
}
