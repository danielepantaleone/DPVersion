//
//  DPVersionConstructorTests.swift
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

class DPVersionConstructorTests: XCTestCase {
    
    func testStable() {
        let v: DPVersion = "1.0"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 0)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testStableFull() {
        let v: DPVersion = "1.0.7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 0)
        XCTAssertEqual(v.patch, 7)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testAlphaShort() {
        let v: DPVersion = "1.1a7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 1)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 7)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testAlphaShortWithStableFull() {
        let v: DPVersion = "1.0.4a7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 0)
        XCTAssertEqual(v.patch, 4)
        XCTAssertEqual(v.alpha, 7)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testAlphaFull() {
        let v: DPVersion = "1.2-alpha7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 2)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 7)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testAlphaFullWithStableFull() {
        let v: DPVersion = "1.7.1-alpha8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 8)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testAlphaFullWithStableFullUnderscored() {
        let v: DPVersion = "1.7.1_alpha8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 8)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaShort() {
        let v: DPVersion = "1.1b7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 1)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 7)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaShortWithStableFull() {
        let v: DPVersion = "1.0.4b7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 0)
        XCTAssertEqual(v.patch, 4)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 7)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaFull() {
        let v: DPVersion = "1.2-beta7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 2)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 7)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaFullWithStableFull() {
        let v: DPVersion = "1.7.1-beta8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 8)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaFullWithStableFullUnderscored() {
        let v: DPVersion = "1.7.1_beta8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 8)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testBetaFullWithStableFullUnderscoredAndPodSyntax() {
        let v: DPVersion = "1.7.1_beta.8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 8)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testDevFull() {
        let v: DPVersion = "1.2-dev7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 2)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 7)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testDevFullWithStableFull() {
        let v: DPVersion = "1.7.1-dev8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 8)
        XCTAssertEqual(v.rc, 0)
    }
    
    func testRcFull() {
        let v: DPVersion = "1.2-rc7"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 2)
        XCTAssertEqual(v.patch, 0)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 7)
    }
    
    func testRcFullWithStableFull() {
        let v: DPVersion = "1.7.1-rc8"
        XCTAssertEqual(v.major, 1)
        XCTAssertEqual(v.minor, 7)
        XCTAssertEqual(v.patch, 1)
        XCTAssertEqual(v.alpha, 0)
        XCTAssertEqual(v.beta, 0)
        XCTAssertEqual(v.dev, 0)
        XCTAssertEqual(v.rc, 8)
    }
    
}
