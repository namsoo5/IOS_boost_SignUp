//
//  ViewController.swift
//  IOS_boost_SignUp
//
//  Created by 남수김 on 06/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    //키보드내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //키보드 done클릭시 키보드내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //로그인시
    @IBAction func signinButton(_ sender: Any) {
        if UserInformation.shared.id == idTextField && UserInformation.shared.pw == pwTextField {
            
        }
    }
    
}

