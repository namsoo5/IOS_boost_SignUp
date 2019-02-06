//
//  UserInformation.swift
//  IOS_boost_SignUp
//
//  Created by 남수김 on 06/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var pw: String?
    var check: String?
    var text: String?
    var date: String?
    var phone: String? = ""
}
