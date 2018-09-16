//
//  ValidationResultsUnitTests.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import XCTest
@testable import UnitTestsBasicMVP

class ValidationResultUnitTests: XCTestCase {
    
    var view: ValidationResultViewSpy!
    var presenter: ValidationResultPresenter!
    var router: ValidationResultWireframeSpy!
    
    func setup(state: Bool) {
        let model = state
    
        view = ValidationResultViewSpy()
        router = ValidationResultWireframeSpy()
        presenter = ValidationResultPresenter(router: router, isSuccess: model)
        presenter.attatchView(view: view)
    }
    
    //********************************************************//
    //* Validation with success context                      *//
    //********************************************************//
    
    func testContextSuccessTitlePassed(){
        setup(state: true)
        XCTAssert(
            view.titlePassed == "Succeeded!",
            "Incorrect title passed"
        )
    }
    
    func testContextSuccessSetTitleCalled (){
        setup(state: true)
        XCTAssert(
            view.setTitleCalled == true,
            "Not calling the correct method to set the Title"
        )
    }
    
    //********************************************************//
    //* Validation with fail context                         *//
    //********************************************************//
    
    func testContextFailureTitlePassed() {
        setup(state: false)
        XCTAssert(
            view.titlePassed == "Failed!",
            "Incorrect title passed"
        )
    }
    
    func testContextFailureSetTitleCalled () {
        setup(state: false)
        XCTAssert(
            view.setTitleCalled == true,
            "Not calling the correct method to set the Title"
        )
    }
    
    //********************************************************//
    //* Testing view method to set color when success        *//
    //********************************************************//
    
    func testContextSuccessSetColorCalled (){
        setup(state: true)
        XCTAssert(
            view.setColorCalled == true,
            "Not calling the correct method to set correct color"
        )
    }
    
    //********************************************************//
    //* Testing view method to set color when failure        *//
    //********************************************************//
    
    func testContextFailureSetColorCalled (){
        setup(state: false)
        XCTAssert(
            view.setColorCalled == true,
            "Not calling the correct method to set correct color"
        )
    }
    
    //********************************************************//
    //* Verify is dismiss action is properly executed        *//
    //********************************************************//
    
    func testDismissCalled() {
        setup(state: true)
        presenter.screenTouched()
        
        XCTAssert(
            router.moduleDismissCalled == true,
            "Not calling the correct method"
        )
    }

    
}

class ValidationResultViewSpy: ValidationResultView {

    var titlePassed: String?
    var setTitleCalled: Bool?
    var setColorCalled: Bool?
    
    func setTitle(_ text: String) {
        titlePassed = text
        setTitleCalled = true
    }
    
    func setSuccessColor() {
        setColorCalled = true
    }
    
    func setFailColor() {
        setColorCalled = true
    }
}

class ValidationResultWireframeSpy: ValidationResultWireFrame {
    
    var moduleDismissCalled: Bool?

    func dismissModule() {
        moduleDismissCalled = true
    }
}
