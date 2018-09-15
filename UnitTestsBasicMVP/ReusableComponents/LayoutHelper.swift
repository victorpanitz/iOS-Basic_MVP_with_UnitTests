//
//  UIView.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

struct VerticalLayoutParameters {
    var view: UIView
    var height: CGFloat
    var topSpace: CGFloat
}

extension UIView {
    
    func addLinearVerticalLayout(parameters: [VerticalLayoutParameters], leftMargin: CGFloat = 0, rightMargin: CGFloat = 0) {
        
        for (i, layout) in parameters.enumerated() {
            print(i-1)
            NSLayoutConstraint.activate([
                layout.view.topAnchor.constraint(equalTo: (i-1 >= 0) ? parameters[i-1].view.bottomAnchor : topAnchor, constant: (i-1 >= 0) ? layout.topSpace : 64),
                layout.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftMargin),
                layout.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: rightMargin),
                layout.view.heightAnchor.constraint(equalToConstant: layout.height)
                ])
        }
    }
}
