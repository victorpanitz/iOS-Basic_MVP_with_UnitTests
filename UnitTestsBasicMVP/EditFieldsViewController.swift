//
//  ViewController.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class EditFieldsViewController: UIViewController {

    let presenter: EditFieldsPresenter
    
    init(presenter: EditFieldsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attatchView(view: self)
    }

}

extension EditFieldsViewController: EditFieldsView {

    func setFirstFieldTitle(_ text: String) {
        
    }
    
    func setFirstInputFieldPlaceholder(_ text: String) {
        
    }
    
    func setSecondFieldTitle(_ text: String) {
        
    }
    
    func setSecondInputFieldPlaceholder(_ text: String) {
        
    }
    
    func setSaveButtonTitle(_ text: String) {
        
    }
    
    func showSuccessAlert(_text: String) {
        
    }
    
    func showErrorAlert(_text: String) {
        
    }
    
}


