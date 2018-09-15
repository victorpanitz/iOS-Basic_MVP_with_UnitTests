//
//  UIButton.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

extension UIButton {
    
    func confirmButton(height: CGFloat = 56, backgroundColor: UIColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), titleSize: CGFloat = 18) -> UIButton {
        layer.cornerRadius = 4
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = UIFont(name: "Avenir", size: titleSize)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
