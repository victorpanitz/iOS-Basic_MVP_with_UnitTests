//
//  ValidationResultViewController.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class ValidationResultViewController: UIViewController {
    
    private let resultLabel: UILabel = UILabel().fieldTitle(fontSize:18)
    
    let presenter: ValidationResultPresenter
    
    init(presenter: ValidationResultPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupObservers()
        presenter.attatchView(view: self)
    }
    
    private func setupConstraints() {
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
    }
    
    private func setupObservers() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(screenTouchedUpInside))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func screenTouchedUpInside() {
        presenter.screenTouched()
    }
    
}

extension ValidationResultViewController: ValidationResultView {
    func setTitle(_ text: String) {
        resultLabel.text = text
    }
    
    func setSuccessColor() {
        view.backgroundColor = .green
    }
    
    func setFailColor() {
        view.backgroundColor = .red
    }
}
