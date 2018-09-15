//
//  UILabel.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

extension UILabel {
    
    func fieldTitle(height: CGFloat = 40, fontSize: CGFloat) -> UILabel {
        font = UIFont(name: "Avenir", size: fontSize)
        textColor = .black
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        return self
    }
}
