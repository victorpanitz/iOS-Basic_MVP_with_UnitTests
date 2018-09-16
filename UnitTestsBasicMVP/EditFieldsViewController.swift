//
//  ViewController.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

class EditFieldsViewController: UIViewController {

    private let firstFieldTitleLabel: UILabel = UILabel().fieldTitle(fontSize:18)
    private let secondFieldTitleLabel: UILabel = UILabel().fieldTitle(fontSize:18)
    private let currentPasswordTextField: UITextField = UITextField().formTextField(
        backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
        textColor: .darkGray,
        textAlignment: .center
    )
    private let newPasswordTextField: UITextField = UITextField().formTextField(
        backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
        textColor: .darkGray,
        textAlignment: .center
    )
    private let saveButton: UIButton = UIButton(type: .system).confirmButton(height: 64)
    
    let presenter: EditFieldsPresenter
    
    init(presenter: EditFieldsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        setupObservers()
        presenter.attatchView(view: self)
    }
    
    private func setupConstraints() {
        view.addSubview(firstFieldTitleLabel)
        view.addSubview(currentPasswordTextField)
        view.addSubview(secondFieldTitleLabel)
        view.addSubview(newPasswordTextField)
        view.addSubview(saveButton)

        view.addLinearVerticalLayout(
            parameters: [
                VerticalLayoutParameters(view: firstFieldTitleLabel, height: 40, topSpace: 15),
                VerticalLayoutParameters(view: currentPasswordTextField, height: 40, topSpace: 0),
                VerticalLayoutParameters(view: secondFieldTitleLabel, height: 40, topSpace: 20),
                VerticalLayoutParameters(view: newPasswordTextField, height: 40, topSpace: 0),
                VerticalLayoutParameters(view: saveButton, height: 64, topSpace: 20),
                ],
            leftMargin: 30,
            rightMargin: -30
        )
    }
    
    private func setupObservers() {
        currentPasswordTextField.addTarget(self, action: #selector(didCurrentPassowrdInputChange), for: .editingChanged)
        newPasswordTextField.addTarget(self, action: #selector(didNewPasswordInputChange), for: .editingChanged)
        saveButton.addTarget(self, action: #selector(saveButtonDidTouchUpInside), for: .touchUpInside)
    }
    
    @objc private func didCurrentPassowrdInputChange() {
        presenter.firstInputDidChange(currentPasswordTextField.text ?? "")
    }
    
    @objc private func didNewPasswordInputChange() {
        presenter.secondInputDidChange(newPasswordTextField.text ?? "")
    }

    @objc private func saveButtonDidTouchUpInside() {
        presenter.saveActionTouched()
    }
}

extension EditFieldsViewController: EditFieldsView {

    func setFirstFieldTitle(_ text: String) {
        firstFieldTitleLabel.text = text
    }
    
    func setFirstInputFieldPlaceholder(_ text: String) {
        currentPasswordTextField.placeholder = text
    }
    
    func setSecondFieldTitle(_ text: String) {
        secondFieldTitleLabel.text = text
    }
    
    func setSecondInputFieldPlaceholder(_ text: String) {
        newPasswordTextField.placeholder = text
    }
    
    func setSaveButtonTitle(_ text: String) {
        saveButton.setTitle(text, for: .normal)
    }
    
}
