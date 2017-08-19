//
//  loginVC.swift
//  Character Card
//
//  Created by user on 2017/7/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    var isCorrect = true
    
    @IBAction func loginBtn(_ sender: Any) {
        loginCheck()
    }
    
    func loginCheck() {
        if isCorrect == true {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "homePageVC"){
                navigationController?.show(vc, sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes
            = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.isTranslucent = false
        
        tapGesture()
    }
}
