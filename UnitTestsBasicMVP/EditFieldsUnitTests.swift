//
//  UnitTestsBasicMVPTests.swift
//  UnitTestsBasicMVPTests
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import XCTest
@testable import UnitTestsBasicMVP

class EditFieldsUnitTests: XCTestCase {

    var view: EditFieldsViewSpy!
    var presenter: EditFieldsPresenter!
    var router: EditFieldsWireframeSpy!
    
    func setup() {
        
        let model = EditFieldsPresenter.ViewModel(
            firstFieldTitle: "Password",
            secondFieldTitle: "New Password",
            firstInputPlaceholder: "Current password",
            secondInputPlaceholder: "New password",
            saveActionTitle: "Save"
        )
        
        view = EditFieldsViewSpy()
        router = EditFieldsWireframeSpy()
        presenter = EditFieldsPresenter(router: router, model: model)
        
        presenter.attatchView(view: view)
    }
    
    override func setUp() {
        setup()
    }
    
    //********************************************************//
    //* Testing if Cur.Password txtField got the right title *//
    //********************************************************//
    
    func testfirstFieldTitlePassed(){
        XCTAssert(
            view.firstFieldTitlePassed == "Password",
            "Incorrect title passed to the first field"
        )
    }
    
    func testSetFirstFieldTitleCalled (){
        XCTAssert(
            view.setFirstFieldTitleCalled == true,
            "Not calling the correct method to set first field Title"
        )
    }
    
    //********************************************************//
    //* Testing if Cur.Password txtField got the right value *//
    //********************************************************//
   
    func testFirstInputPlaceholderPassed() {
        XCTAssert(
            view.firstInputPlaceholderPassed == "Current password",
            "Incorrect value passed to the first input field"
        )
    }
    
    func testSetFirstInputPlaceholderCalled() {
        XCTAssert(
            view.setFirstInputPlaceholderCalled == true,
            "Not calling the correct method"
        )
    }
    
    //********************************************************//
    //* Testing if New Password txtField got the right title *//
    //********************************************************//
    
    func testSecondFieldTitlePassed() {
        XCTAssert(
            view.secondFieldTitlePassed == "New Password",
            "Incorrect title passed to the first field"
        )
    }
    
    func testSetSecondFieldTitleCalled() {
        XCTAssert(
            view.setSecondFieldTitleCalled == true,
            "Not calling the correct method"
        )
    }
    
    //********************************************************//
    //* Testing if New Password txtField got the right value *//
    //********************************************************//
    
    func testSecondInputPlaceholderPassed() {
        XCTAssert(
            view.secondInputPlaceholderPassed == "New password",
            "Incorrect value passed to the second input field"
        )
    }
    
    func testSetSecondInputPlaceholderCalled() {
        XCTAssert(
            view.setSecondInputPlaceholderCalled == true,
            "Not calling the correct method"
        )
    }
    
    //********************************************************//
    //* Testing if the Save action is properly configured    *//
    //********************************************************//
    
    func testSaveButtonTitlePassed() {
        XCTAssert(
            view.saveButtonTitlePassed == "Save",
            "Incorrect value passed to the current button"
        )
    }
    
    func testSetSaveButtonTitleCalled() {
        XCTAssert(
            view.setSaveButtonTitleCalled == true,
            "Not calling the correct method"
        )
    }

    //********************************************************//
    //* Testing both contexts when saving the new password   *//
    //********************************************************//
    
    
    func testContextNewPasswordDifferentNotEmpty() {
        presenter.firstInputDidChange("highsecret")
        presenter.secondInputDidChange("pass2")
        presenter.saveActionTouched()
        
        XCTAssert(
            router.showResultScreenCalled == true,
            "Not calling the correct method"
        )
        
        XCTAssert(
            router.resultPassed == true,
            "result success"
        )
    }
    
    func testContextNewPasswordEquals() {
        presenter.firstInputDidChange("hightsecret")
        presenter.secondInputDidChange("highsecret")
        presenter.saveActionTouched()
        
        XCTAssert(
            router.showResultScreenCalled == true,
            "Not calling the correct method"
        )
        
        XCTAssert(
            router.resultPassed == false,
            "result fail"
        )
    }
    
    func testContextNewPasswordEmpty() {
        presenter.firstInputDidChange("highsecret")
        presenter.secondInputDidChange("")
        presenter.saveActionTouched()
        
        XCTAssert(
            router.showResultScreenCalled == true,
            "Not calling the correct method"
        )
        
        XCTAssert(
            router.resultPassed == false,
            "result fail"
        )
    }
    
}

class EditFieldsViewSpy: EditFieldsView {
    
    var firstFieldTitlePassed: String?
    var firstInputPlaceholderPassed: String?
    var secondFieldTitlePassed: String?
    var secondInputPlaceholderPassed: String?
    var saveButtonTitlePassed: String?
    
    var setFirstFieldTitleCalled: Bool?
    var setFirstInputPlaceholderCalled: Bool?
    var setSecondFieldTitleCalled: Bool?
    var setSecondInputPlaceholderCalled: Bool?
    var setSaveButtonTitleCalled: Bool?
    
    func setFirstFieldTitle(_ text: String) {
        firstFieldTitlePassed = text
        setFirstFieldTitleCalled = true
    }
    
    func setFirstInputFieldPlaceholder(_ text: String) {
        firstInputPlaceholderPassed = text
        setFirstInputPlaceholderCalled = true
    }
    
    func setSecondFieldTitle(_ text: String) {
        secondFieldTitlePassed = text
        setSecondFieldTitleCalled = true
    }
    
    func setSecondInputFieldPlaceholder(_ text: String) {
        secondInputPlaceholderPassed = text
        setSecondInputPlaceholderCalled = true
    }
    
    func setSaveButtonTitle(_ text: String) {
        saveButtonTitlePassed = text
        setSaveButtonTitleCalled = true
    }

}

class EditFieldsWireframeSpy: EditFieldsWireFrame {
    
    var showResultScreenCalled: Bool?
    var resultPassed: Bool?
    
    func showResultScreen(isSuccess: Bool) {
        showResultScreenCalled = true
        resultPassed = isSuccess
    }
}
