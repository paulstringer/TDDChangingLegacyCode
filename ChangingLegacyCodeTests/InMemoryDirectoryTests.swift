//
//  InMemoryDirectoryTests.swift
//  ChangingLegacyCode
//
//  Created by Paul Stringer on 24/05/2016.
//  Copyright © 2016 stringerstheory. All rights reserved.
//

import XCTest
@testable import ChangingLegacyCode

class InMemoryDirectoryTests: XCTestCase {

    let directory = InMemoryDirectory()

    func testEmptyDirectory_NumberOfElements() {
        XCTAssertEqual(directory.elementCount, 0);
    }
    
    func testEmptyDirectory_Element() {
        XCTAssertNil(directory.element(""))
    }
    
    func testEmptyDirectory_AddingElement() {
        directory.addElement(Element(name: ""))
        XCTAssertEqual(directory.elementCount, 1);
    }
    
    func testEmptyDirectory_GenerateIndex() {
        directory.generateIndex()
        XCTAssertEqual(directory.elementCount, 1)
    }
    
    func testEmptyDirectory_GenerateIndex_Index() {
        directory.generateIndex()
        XCTAssertNotNil(directory.element("Index"))
    }
    
    func testNonEmptyDirectory_GenerateIndexWithElement() {
        directory.addElement(Element(name:"1"))
        directory.generateIndex();
        XCTAssertNotNil(directory.element("Index1\n"))
    }
    
    func testNonEmptyDirectory_GenerateIndexWithMultipleElements() {
        directory.addElement(Element(name:"1"))
        directory.addElement(Element(name:"2"))
        directory.generateIndex();
        XCTAssertNotNil(directory.element("Index1\n2\n"))
    }
    
    func testNonEmptyDirectory_GenerateIndexTwice() {
        directory.addElement(Element(name:"1"))
        directory.generateIndex()
        directory.generateIndex()
        XCTAssertEqual(directory.elementCount, 2)
        XCTAssertNotNil(directory.element("Index1\n"))
    }
    
    
    // Here it got hard!
    
    // ReadMe http://blog.8thlight.com/uncle-bob/2013/05/27/TheTransformationPriorityPremise.html
    
    func testEmptyDirectory_AddingElementAfterGeneratingIndex() {
        directory.addElement(Element(name:"1"))
        directory.generateIndex()
        directory.addElement(Element(name:"2"))
        XCTAssertNotNil(directory.element("Index1\n2\n"))
    }
    
    func testIndexGenerated_AddingElement() {
        directory.generateIndex()
        directory.addElement(Element(name:"1"))
        XCTAssertNotNil(directory.element("Index1\n"))
    }
    
    
    
}
