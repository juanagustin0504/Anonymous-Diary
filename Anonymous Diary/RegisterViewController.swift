//
//  RegisterViewController.swift
//  Anonymous Diary
//
//  Created by Webcash on 2019/12/06.
//  Copyright © 2019 Moon. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    @IBOutlet weak var swAgree: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "회원가입"
        
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        if let name = txtName.text, let email = txtEmail.text, let password = txtPassword.text, let confirmPW = txtConfirmPassword.text {
            guard email.contains(".com") || email.contains(".net") || email.contains(".co.kr") else {
                failRegisterAlert()
                return
            }
            
            guard password.elementsEqual(confirmPW) else {
                failRegisterAlert()
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if user != nil {
                    print("register success")
                } else {
                    print("register failed")
                }
            })
            
            var ref = Database.database().reference()
            
        }
    }
    
    func failRegisterAlert() {
        let alert = UIAlertController(title: "회원가입 실패", message: "입력 정보를 확인해주세요.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true)
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
