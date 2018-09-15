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
    
    func setup() {
        
        let model = EditFieldsPresenter.ViewModel(
            firstFieldTitle: "Password",
            secondFieldTitle: "New Password",
            firstInputPlaceholder: "Current password",
            secondInputPlaceholder: "New password",
            saveActionTitle: "Save"
        )
        
        view = EditFieldsViewSpy()
        presenter = EditFieldsPresenter(model: model)
        
        presenter.attatchView(view: view)
    }
    
    override func setUp() {
        setup()
    }
    
    func testWhenViewAttached() {
        
        //********************************************************//
        //* Testing if Cur.Password txtField got the right title *//
        //********************************************************//
        
        XCTAssert(
            view.firstFieldTitlePassed == "Password",
            "Incorrect title passed to the first field"
        )
        
        XCTAssert(
            view.setFirstFieldTitleCalled == true,
            "Not calling the correct method to set first field Title"
        )

        //********************************************************//
        //* Testing if Cur.Password txtField got the right value *//
        //********************************************************//
        
        XCTAssert(
            view.firstInputPlaceholderPassed == "Current password",
            "Incorrect value passed to the first input field"
        )
        
        XCTAssert(
            view.setFirstInputPlaceholderCalled == true,
            "Not calling the correct method"
        )

        //********************************************************//
        //* Testing if New Password txtField got the right title *//
        //********************************************************//
        
        XCTAssert(
            view.secondFieldTitlePassed == "New Password",
            "Incorrect title passed to the first field"
        )
        
        XCTAssert(
            view.setSecondFieldTitleCalled == true,
            "Not calling the correct method"
        )

        //********************************************************//
        //* Testing if New Password txtField got the right value *//
        //********************************************************//
        
        XCTAssert(
            view.secondInputPlaceholderPassed == "New password",
            "Incorrect value passed to the second input field"
        )
        
        XCTAssert(
            view.setSecondInputPlaceholderCalled == true,
            "Not calling the correct method"
        )
        
        //********************************************************//
        //* Testing if the Save action is properly configured    *//
        //********************************************************//
        
        XCTAssert(
            view.saveButtonTitle == "Save",
            "Incorrect value passed to the current button"
        )
        
        XCTAssert(
            view.setSaveButtonTitleCalled == true,
            "Not calling the correct method"
        )
        
    }

    //********************************************************//
    //* Testing both contexts when saving the new password   *//
    //********************************************************//
    
    
    func testContextNewPasswordIsValid() {
        
        presenter.firstInputDidChange("pass1")
        presenter.secondInputDidChange("pass2")
        presenter.saveActionTouched(from: UIViewController())
        
        XCTAssert(
            view.showSuccessAlertCalled == true,
            "Not calling the correct method"
        )
    }
    
    func testContextNewPasswordIsNotValid() {
        
        presenter.firstInputDidChange("pass1")
        presenter.secondInputDidChange("pass1")
        presenter.saveActionTouched(from: UIViewController())
        
        XCTAssert(
            view.showErrorAlertCalled == true,
            "Not calling the correct method"
        )
    }
    
}

class EditFieldsViewSpy: EditFieldsView {
    
    var firstFieldTitlePassed: String?
    var firstInputPlaceholderPassed: String?
    var secondFieldTitlePassed: String?
    var secondInputPlaceholderPassed: String?
    var saveButtonTitle: String?
    
    var setFirstFieldTitleCalled: Bool?
    var setFirstInputPlaceholderCalled: Bool?
    var setSecondFieldTitleCalled: Bool?
    var setSecondInputPlaceholderCalled: Bool?
    var setSaveButtonTitleCalled: Bool?
    var showSuccessAlertCalled: Bool?
    var showErrorAlertCalled: Bool?
    
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
        saveButtonTitle = text
        setSaveButtonTitleCalled = true
    }
    
    func showSuccessAlert(_text: String) {
        showSuccessAlertCalled = true
    }
    
    func showErrorAlert(_text: String) {
        showErrorAlertCalled = true
    }
}
