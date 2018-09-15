//
//  UITextField.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

extension UITextField {
  
    func formTextField(height: CGFloat = 40, backgroundColor: UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), textColor: UIColor = .black, textAlignment: NSTextAlignment = .center) -> UITextField {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.textAlignment = textAlignment
        layer.cornerRadius = 4
        translatesAutoresizingMaskIntoConstraints = false
    
        return self
    }
}

