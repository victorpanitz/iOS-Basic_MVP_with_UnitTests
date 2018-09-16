//
//  EditFieldsRouter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class EditFieldsRouter: EditFieldsWireFrame {
    
    var view: UIViewController?
    
    func showResultScreen(isSuccess: Bool) {
        let router = ValidationResultRouter()
        let presenter = ValidationResultPresenter(router: router, isSuccess: isSuccess)
        let viewController = ValidationResultViewController(presenter: presenter)
        router.view = viewController
        view?.present(viewController, animated: true, completion: nil)
    }
    
}
