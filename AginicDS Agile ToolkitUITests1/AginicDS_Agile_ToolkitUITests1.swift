//
//  AginicDS_Agile_ToolkitUITests1.swift
//  AginicDS Agile ToolkitUITests1
//
//  Created by Paul Thornton on 28/06/2018.
//  Copyright © 2018 Paul Thornton. All rights reserved.
//

import XCTest

class AginicDS_Agile_ToolkitUITests1: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGameLoad() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let element = XCUIApplication().children(matching: .window).element(boundBy: 4).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2)
        element.tap()
        
        let app = XCUIApplication()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["More"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Game"]/*[[".cells.staticTexts[\"Game\"]",".staticTexts[\"Game\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tabBarsQuery.buttons["Slpash"].tap()
        
    }
    
}
