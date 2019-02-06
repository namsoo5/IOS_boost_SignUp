//
//  SignForm2ViewController.swift
//  IOS_boost_SignUp
//
//  Created by 남수김 on 06/02/2019.
//  Copyright © 2019 남수김. All rights reserved.
//

import UIKit

class SignForm2ViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    //시간형식지정
    let dateformat: DateFormatter = {
        let format: DateFormatter = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        format.locale = Locale(identifier: "ko_KR")
        return format
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //초기시간설정
        let date:Date = Date()
        let dateString:String = dateformat.string(from: date)
        self.birthLabel.text = dateString
        
    }
    
    //취소버튼
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //이전버튼
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //가입버튼
    @IBAction func signupButton(_ sender: Any) {
        //폰번호 생년월일저장
        UserInformation.shared.phone = phoneTextField.text
        UserInformation.shared.date = birthLabel.text
        self.dismiss(animated: true, completion: nil)
    }
    
    //datePicker
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let date:Date = sender.date
        let dateString: String = self.dateformat.string(from: date)
        self.birthLabel.text = dateString
        self.signupButton.isEnabled = true
    }
    
    //키보드내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
