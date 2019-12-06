//
//  ViewController.swift
//  Anonymous Diary
//
//  Created by Webcash on 2019/12/06.
//  Copyright © 2019 Moon. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            txtEmail.placeholder = "이미 로그인된 상태입니다."
            txtPassWord.placeholder = "이미 로그인된 상태입니다."
            btnLogin.setTitle("이미 로그인된 상태입니다.", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.navigationController?.title = user?.email
        }
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassWord.text!, completion: { (user, error) in
            if user != nil {
                print("login success")
            } else {
                print("login fail")
            }
            
        })
    }
    
    @IBAction func btnPushRegister(_ sender: UIButton) { self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC"))!, animated: true)
    }
    
}

