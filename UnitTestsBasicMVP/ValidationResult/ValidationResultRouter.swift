//
//  ValidationResultViper.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class ValidationResultRouter: ValidationResultWireFrame {
   
    weak var view: UIViewController?
    
    func buildModule(isSuccess: Bool) -> UIViewController {
        let router = ValidationResultRouter()
        let presenter = ValidationResultPresenter(router: router, isSuccess: isSuccess)
        let viewController = ValidationResultViewController(presenter: presenter)
        router.view = viewController
        return viewController
    }
    
    func dismissModule() {
        view?.dismiss(animated: true, completion: nil)
    }
}
