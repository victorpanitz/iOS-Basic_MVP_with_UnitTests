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
    
    func dismissModule() {
        view?.dismiss(animated: true, completion: nil)
    }
}
