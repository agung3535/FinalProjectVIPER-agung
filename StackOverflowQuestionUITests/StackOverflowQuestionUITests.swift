//
//  StackOverflowQuestionUITests.swift
//  StackOverflowQuestionUITests
//
//  Created by Agung Dwi Saputra on 16/11/23.
//

import XCTest

final class StackOverflowQuestionUITests: XCTestCase {


    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Asked on 28 June 2009 at 04:54"]/*[[".cells.staticTexts[\"Asked on 28 June 2009 at 04:54\"]",".staticTexts[\"Asked on 28 June 2009 at 04:54\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Question"].buttons["Top Questions"].tap()
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
