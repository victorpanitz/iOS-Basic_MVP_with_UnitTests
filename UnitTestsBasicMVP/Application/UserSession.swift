//
//  UserSession.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 15/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import Foundation

class UserSession {
    
    static let shared = UserSession.init()

    let password = "highsecret"
    
}
