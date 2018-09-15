//
//  EditProfilePresenter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

protocol EditFieldsView: class {
    func setFirstFieldTitle(_ text: String)
    func setFirstInputFieldPlaceholder(_ text: String)
    func setSecondFieldTitle(_ text: String)
    func setSecondInputFieldPlaceholder(_ text: String)
    func setSaveButtonTitle(_ text: String)
    func showSuccessAlert(_text: String)
    func showErrorAlert(_text: String)
}

class EditFieldsPresenter {
    
    private weak var view: EditFieldsView?
    private let model: ViewModel
    private var password: String?
    private var newPassword: String?
    
    init(model: ViewModel) {
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
    
    
    // PLEASE, do not use strings like that (showAlert functions), add a .STRINGS FILE to each module and put your STRINGS THERE :D
    func saveActionTouched(from viewController: UIViewController) {
        guard let `password` = password, let `newPassword` = newPassword, password != newPassword, !newPassword.isEmpty else {
            view?.showErrorAlert(_text: "Your new password is not valid")
            return
        }
        view?.showSuccessAlert(_text: "New password saved with success")

    }
    
}
