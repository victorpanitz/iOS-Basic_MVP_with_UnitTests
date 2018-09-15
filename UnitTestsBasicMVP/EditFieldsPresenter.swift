//
//  EditProfilePresenter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation

protocol EditFieldsView: class {
    func setFirstFieldTitle(_ text: String)
    func setFirstInputFieldPlaceholder(_ text: String)
    func setSecondFieldTitle(_ text: String)
    func setSecondInputFieldPlaceholder(_ text: String)
    func setSaveButtonTitle(_ text: String)
}

protocol EditFieldsWireFrame: class {
    func showSuccessAlert()
    func showErrorAlert()
}

class EditFieldsPresenter {
    
    // MARK: Private properties
    
    private weak var view: EditFieldsView?
    private var router: EditFieldsWireFrame
    private let model: ViewModel
    private var password: String?
    private var newPassword: String?
    
    // MARK: public methods
    
    init(router: EditFieldsWireFrame, model: ViewModel) {
        self.router = router
        self.model = model
    }
    
    func attatchView(view: EditFieldsView) {
        self.view = view
        view.setFirstFieldTitle(model.firstFieldTitle)
        view.setFirstInputFieldPlaceholder(model.firstInputPlaceholder)
        view.setSecondFieldTitle(model.secondFieldTitle)
        view.setSecondInputFieldPlaceholder(model.secondInputPlaceholder)
        view.setSaveButtonTitle(model.saveActionTitle)
    }
    
    func firstInputDidChange(_ value: String) {
        password = value
    }
    
    func secondInputDidChange(_ value: String) {
        newPassword = value
    }
    
    func saveActionTouched() {
        guard let `password` = password,
            let `newPassword` = newPassword, password == UserSession.shared.password, password != newPassword, !newPassword.isEmpty else {
            router.showErrorAlert()
            return
        }
        router.showSuccessAlert()
    }
}
