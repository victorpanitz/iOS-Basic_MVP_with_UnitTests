//
//  EditFieldsRouter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class EditFieldsRouter {
    
    weak var view: UIViewController?
    
    func buildModule(model: EditFieldsPresenter.ViewModel) -> UIViewController {
        let router = EditFieldsRouter()
        let presenter = EditFieldsPresenter(router: router, model: model)
        let viewController = EditFieldsViewController(presenter: presenter)
        router.view = viewController
        return viewController
    }
}

extension EditFieldsRouter: EditFieldsWireFrame {
    func showResultScreen(isSuccess: Bool) {
        let validationRouter = ValidationResultRouter()
        let viewController = validationRouter.buildModule(isSuccess: isSuccess)
        view?.present(viewController, animated: true, completion: nil)
    }
}
