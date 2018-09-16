//
//  ValidationResultPresenter.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation

protocol ValidationResultView: class {
    func setTitle(_ text: String)
    func setSuccessColor()
    func setFailColor()
}

protocol ValidationResultWireFrame: class {
    func dismissModule()
}

class ValidationResultPresenter {
    
    // MARK: Private properties
    
    private weak var view: ValidationResultView?
    private var router: ValidationResultWireFrame
    let isSuccess: Bool
    
    // MARK: public methods
    
    init(router: ValidationResultWireFrame, isSuccess: Bool) {
        self.router = router
        self.isSuccess = isSuccess
    }
    
    func attatchView(view: ValidationResultView) {
        self.view = view
        switch isSuccess {
        case true:
            view.setSuccessColor()
            view.setTitle("Succeeded!")
        case false:
            view.setFailColor()
            view.setTitle("Failed!")
        }
    }
    
    func screenTouched() {
        router.dismissModule()
    }
}
