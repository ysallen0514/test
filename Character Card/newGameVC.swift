//
//  newGameVC.swift
//  Character Card
//
//  Created by user on 2017/7/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class newGameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    
}
