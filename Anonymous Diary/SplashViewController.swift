//
//  SplashViewController.swift
//  Anonymous Diary
//
//  Created by Webcash on 2019/12/06.
//  Copyright © 2019 Moon. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = self.view.frame
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        Thread.sleep(forTimeInterval: 2.0)
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(loginVC!, animated: true)
        
    }
    


}
