//
//  DPVersionComparableTests.swift
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

class DPVersionComparableTests: XCTestCase {
    
    func testCompareSameStable() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertFalse(b.isPreRelease)
    }
    
    func testCompareSameStableWithDifferentAlpha() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, alpha: 1)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, alpha: 2)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isAlpha)
        XCTAssertTrue(b.isAlpha)
    }
    
    func testCompareSameStableWithDifferentBeta() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, beta: 1)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, beta: 2)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isBeta)
        XCTAssertTrue(b.isBeta)
    }
    
    func testCompareSameStableWithDifferentDev() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, dev: 1)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, dev: 2)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isDevelopment)
        XCTAssertTrue(b.isDevelopment)
    }
    
    func testCompareSameStableWithDifferentRc() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, rc: 1)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 4, rc: 2)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isRc)
        XCTAssertTrue(b.isRc)
    }
    
    func testCompareStableAndAlpha() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, alpha: 3)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(b.isAlpha)
    }
    
    func testCompareStableAndBeta() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, beta: 3)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(b.isBeta)
    }
    
    func testCompareStableAndDev() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, dev: 3)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(b.isDevelopment)
    }
    
    func testCompareStableAndRc() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, rc: 3)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertFalse(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(b.isRc)
    }
    
    func testCompareAlphaAndBeta() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, alpha: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, beta: 1)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isAlpha)
        XCTAssertTrue(b.isBeta)
    }
    
    func testCompareAlphaAndDev() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, alpha: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, dev: 345)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isAlpha)
        XCTAssertTrue(b.isDevelopment)
    }
    
    func testCompareAlphaAndRc() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, alpha: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, rc: 1)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isAlpha)
        XCTAssertTrue(b.isRc)
    }
    
    func testCompareBetaAndDev() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, beta: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, dev: 345)
        XCTAssertGreaterThan(a, b)
        XCTAssertGreaterThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isBeta)
        XCTAssertTrue(b.isDevelopment)
    }
    
    func testCompareBetaAndRc() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, beta: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, rc: 1)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isBeta)
        XCTAssertTrue(b.isRc)
    }
    
    func testCompareDevAndRc() {
        let a: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, dev: 12)
        let b: DPVersion = DPVersion(major: 1, minor: 3, patch: 2, rc: 1)
        XCTAssertLessThan(a, b)
        XCTAssertLessThanOrEqual(a, b)
        XCTAssertNotEqual(a, b)
        XCTAssertTrue(a.isPreRelease)
        XCTAssertTrue(b.isPreRelease)
        XCTAssertTrue(a.isDevelopment)
        XCTAssertTrue(b.isRc)
    }
    
}
