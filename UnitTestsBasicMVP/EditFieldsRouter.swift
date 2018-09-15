//
//  EditFieldsRouter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class EditFieldsRouter: EditFieldsWireFrame {
    
    weak var view: UIViewController?
    
    // PLEASE, do not use strings like that (showAlert methods), add a .STRINGS FILE to each module and put your STRINGS THERE :D I strongly advice you to use third part library (R) to handle it.
    
    func showSuccessAlert() {
        let alert = UIAlertController(
            title: "Success!",
            message: "You have updated your password",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        view?.present(alert, animated: true)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(
            title: "Ops!",
            message: "Something got wrong, verify your current password and if your new password is different and not empty.",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        view?.present(alert, animated: true)
    }
    
}
