
import UIKit

class SignFormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwtextField: UITextField!
    @IBOutlet weak var checktextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imgButton: UIButton!
    
    //이미지선택클릭시 해당코드 실행
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary  //앨범
        picker.allowsEditing = true  //편집모드
        picker.delegate = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //cancel
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //다음버튼 클릭시
    @IBAction func bt_next(_ sender: UIButton) {
        UserInformation.shared.id = idTextField.text
        UserInformation.shared.pw = pwtextField.text
        UserInformation.shared.check = checktextField.text
        UserInformation.shared.text = textView.text
        
        //navigation이용하여 다음화면으로(인터페이스 빌더이용)
    }
    
    //pw나 check 입력후 실행
    @IBAction func pwCheck(_ sender: UITextField) {
        if sender.tag == 1 {  //pw와check같을때 버튼활성화
            if sender.text == checktextField.text {
                nextButton.isEnabled = true
            }else {
                nextButton.isEnabled = false
            }
        }else if sender.tag == 2 {
            if sender.text == pwtextField.text {
                nextButton.isEnabled = true
            }else {
                nextButton.isEnabled = false
            }
        }
    }
    
    //이미지 선택클릭시
    @IBAction func imgSelect(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil) //앨범으로 이동
    }
    
    //앨범에서 취소시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //앨범에서 이미지 선택시
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgButton.setBackgroundImage(image, for: UIControl.State.normal)
            imgButton.setTitle("", for: UIControl.State.normal)
            //이미지 변경
        }
        self.dismiss(animated: true, completion: nil)
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
