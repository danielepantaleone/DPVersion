//
//  DPVersionEquatableTests.swift
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

class DPVersionEquatableTests: XCTestCase {
    
    func testCompareEqualStable() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 4)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4)
        XCTAssertEqual(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertFalse(b.isPreRelease)
    }
    
    func testCompareEqualAlpha() {
        let a: DPVersion = DPVersion(major: 2, minor: 3, patch: 0, alpha: 7)
        let b: DPVersion = DPVersion(major: 2, minor: 3, patch: 0, alpha: 7)
        XCTAssertEqual(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isAlpha)
        XCTAssertTrue(b.isAlpha)
    }
    
    func testCompareEqualBeta() {
        let a: DPVersion = DPVersion(major: 5, minor: 1, patch: 0, beta: 4)
        let b: DPVersion = DPVersion(major: 5, minor: 1, patch: 0, beta: 4)
        XCTAssertEqual(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isBeta)
        XCTAssertTrue(b.isBeta)
    }
    
    func testCompareEqualDev() {
        let a: DPVersion = DPVersion(major: 1, minor: 1, patch: 0, dev: 5)
        let b: DPVersion = DPVersion(major: 1, minor: 1, patch: 0, dev: 5)
        XCTAssertEqual(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isDevelopment)
        XCTAssertTrue(b.isDevelopment)
    }
    
    func testCompareEqualRc() {
        let a: DPVersion = DPVersion(major: 2, minor: 3, patch: 4, rc: 1)
        let b: DPVersion = DPVersion(major: 2, minor: 3, patch: 4, rc: 1)
        XCTAssertEqual(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isRc)
        XCTAssertTrue(b.isRc)
    }
    
}
