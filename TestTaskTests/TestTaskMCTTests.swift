//
//  TestTaskMCTTests.swift
//  TestTaskMCTTests
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import XCTest
@testable import TestTaskMCT

class TestTaskMCTTests: XCTestCase {

    func testParametersString1() {
        let parametersDictionary: [String: String] = [:]
        XCTAssertEqual(parametersDictionary.parametersString, "")
    }
    
    func testParametersString2() {
        let parametersDictionary: [String: String] = ["key1": "value1", "key2": "value2"]
        XCTAssertEqual(parametersDictionary.parametersString, "?key1=value1&key2=value2")
    }
    
    func testParametersString3() {
        let parametersDictionary: [String: String] = ["key1": "value1", "key2": "222"]
        XCTAssertNotEqual(parametersDictionary.parametersString, "?key1=value1&key2=value2")
    }
}
