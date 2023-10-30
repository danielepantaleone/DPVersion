//
//  DPVersion.swift
//  DPVersion
//
//  Created by Daniele Pantaleone
//    - Github: https://github.com/danielepantaleone
//    - LinkedIn: https://www.linkedin.com/in/danielepantaleone
//
//  Copyright © 2023 Daniele Pantaleone. Licensed under MIT License.
//

import Foundation

/// A data model to store and compare software version numbers (see "https://semver.org").
public struct DPVersion: Codable, Equatable, Comparable, CustomStringConvertible, ExpressibleByStringLiteral {
    
    /// The major version number.
    public private (set) var major: Int
    /// The minor version number.
    public private (set) var minor: Int
    /// The patch version number.
    public private (set) var patch: Int
    /// The alpha version number or `0` if this version is not an alpha.
    public private (set) var alpha: Int
    /// The beta version number or `0` if this version is not a beta.
    public private (set) var beta: Int
    /// The development version number or `0` if this version is not a development one.
    public private (set) var dev: Int
    /// The release candidate version number or `0` if this version is not a release candidate.
    public private (set) var rc: Int
    
    // MARK: - Computed properties
    
    /// Returns `true` if this version is an Alpha, `false` otherwise.
    public var isAlpha: Bool { alpha != 0 }
    /// Returns `true` if this version is a Beta one, `false` otherwise.
    public var isBeta: Bool { beta != 0 }
    /// Returns `true` if this version is a Development one, `false` otherwise.
    public var isDevelopment: Bool { dev != 0 }
    /// Returns `true` if this version is a Release Candidate one, `false` otherwise.
    public var isRc: Bool { rc != 0 }
    /// Returns `true` if this version is a Pre-Release one (i.e. Alpha || Beta || Development || Release Candidate), `false` otherwise.
    public var isPreRelease: Bool { isAlpha || isBeta || isDevelopment || isRc }
    
    // MARK: - Initialization
    
    /// Construct a new Stable version.
    ///
    /// - parameters:
    ///   - major: The major version number
    ///   - minor: The minor version number
    ///   - patch: The patch version number
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.alpha = 0
        self.beta = 0
        self.dev = 0
        self.rc = 0
    }
    
    /// Construct a new Alpha version.
    ///
    /// - parameters:
    ///   - major: The major version number
    ///   - minor: The minor version number
    ///   - patch: The patch version number
    ///   - alpha: The alpha version number
    public init(major: Int, minor: Int, patch: Int, alpha: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.alpha = alpha
        self.beta = 0
        self.dev = 0
        self.rc = 0
    }
    
    /// Construct a new Beta version.
    ///
    /// - parameters:
    ///   - major: The major version number
    ///   - minor: The minor version number
    ///   - patch: The patch version number
    ///   - beta: The beta version number
    public init(major: Int, minor: Int, patch: Int, beta: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.alpha = 0
        self.beta = beta
        self.dev = 0
        self.rc = 0
    }
    
    /// Construct a new Development version.
    ///
    /// - parameters:
    ///   - major: The major version number
    ///   - minor: The minor version number
    ///   - patch: The patch version number
    ///   - dev: The development version number
    public init(major: Int, minor: Int, patch: Int, dev: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.alpha = 0
        self.beta = 0
        self.dev = dev
        self.rc = 0
    }
    
    /// Construct a new Release Candidate version.
    ///
    /// - parameters:
    ///   - major: The major version number
    ///   - minor: The minor version number
    ///   - patch: The patch version number
    ///   - rc: The release candidate version
    public init(major: Int, minor: Int, patch: Int, rc: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.alpha = 0
        self.beta = 0
        self.dev = 0
        self.rc = rc
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        var version = "\(major).\(minor).\(patch)"
        if rc > 0 {
            version += "-rc\(rc)"
        } else if beta > 0 {
            version += "-beta\(beta)"
        } else if alpha > 0 {
            version += "-alpha\(alpha)"
        } else if dev > 0 {
            version += "-dev\(dev)"
        }
        return version
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.major == rhs.major &&
            lhs.minor == rhs.minor &&
            lhs.patch == rhs.patch &&
            lhs.rc == rhs.rc &&
            lhs.beta == rhs.beta &&
            lhs.alpha == rhs.alpha &&
            lhs.dev == rhs.dev
    }

    // MARK: - Comparable
    
    public static func < (lhs: DPVersion, rhs: DPVersion) -> Bool {
        
        func compare(_ lhs: [Int], _ rhs: [Int]) -> ComparisonResult {
            for (lhsValue, rhsValue) in zip(lhs, rhs) {
                if lhsValue < rhsValue {
                    return .orderedAscending
                } else if lhsValue > rhsValue {
                    return .orderedDescending
                }
            }
            return .orderedSame
        }
        
        let cmp = compare([lhs.major, lhs.minor, lhs.patch], [rhs.major, rhs.minor, rhs.patch])
        if cmp != .orderedSame {
            // Different stable version => check if lhs is lower than rhs
            return cmp == .orderedAscending
        }
        if !lhs.isPreRelease && rhs.isPreRelease {
            // Same stable version but lhs is not prerelease => lhs is greater
            return false
        }
        if lhs.isPreRelease && !rhs.isPreRelease {
            // Same stable version but rhs is not prerelease => lhs is smaller
            return true
        }
        // Resort to compare prerelease version
        return compare(
            [lhs.rc, lhs.beta, lhs.alpha, lhs.dev],
            [rhs.rc, rhs.beta, rhs.alpha, rhs.dev]
        ) == .orderedAscending
    }
    
    // MARK: - ExpressibleByStringLiteral
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        
        func findInt(from match: NSTextCheckingResult?, at index: Int, in buffer: String) -> Int {
            if let match,
               let valueRange = Range(match.range(at: index), in: buffer),
               let valueCapture = Int(buffer[valueRange]) {
                return valueCapture
            }
            return 0
        }

        func findStr(from match: NSTextCheckingResult?, at index: Int, in buffer: String) -> String? {
            if let match, let valueRange = Range(match.range(at: index), in: buffer) {
                return String(buffer[valueRange]).lowercased()
            }
            return nil
        }

        let pattern = try? NSRegularExpression(pattern: "^(\\d+)\\.(\\d+)(\\.(\\d+))?([-_]?(a|alpha|b|beta|rc|dev)(\\.)?(\\d+))?$", options: .caseInsensitive)
        let match = pattern?.firstMatch(in: value, range: NSRange(location: 0, length: value.count))
        major = findInt(from: match, at: 1, in: value)
        minor = findInt(from: match, at: 2, in: value)
        patch = findInt(from: match, at: 4, in: value)
        alpha = 0
        beta = 0
        dev = 0
        rc = 0
        if let tag = findStr(from: match, at: 6, in: value) {
            let version = findInt(from: match, at: 8, in: value)
            if tag == "a" || tag == "alpha" {
                alpha = version
            } else if tag == "b" || tag == "beta" {
                beta = version
            } else if tag == "dev" {
                dev = version
            } else if tag == "rc" {
                rc = version
            }
        }
        
    }
    
}
