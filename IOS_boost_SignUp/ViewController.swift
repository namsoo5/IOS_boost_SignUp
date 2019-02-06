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
        
        if UserInformation.shared.id != nil{
            if UserInformation.shared.id! == idTextField.text! && UserInformation.shared.pw! == pwTextField.text! {
                //아이디 비번 같을시
                
                //navigation설정, withIdentifier에는 storyboardId를 적는다
                guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {
                    print("View controller not found")
                    return
                }
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else {
                // 아이디 비번다를시 알림창
                let alert: UIAlertController = UIAlertController(title: "알림", message: "틀리셨습니다", preferredStyle: UIAlertController.Style.alert)
                let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

