//
//  homePageVC.swift
//  Character Card
//
//  Created by user on 2017/7/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class homePageVC: UIViewController {

    @IBOutlet weak var imgGM: UIImageView!
    
    @IBOutlet weak var imgPlayer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createTextButton(title: "登出")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    

        imgPlayer.image = UIImage(named: "imgPlayer.png")
        imgPlayer.contentMode = .scaleAspectFit
        imgPlayer.layer.cornerRadius = 5
        imgPlayer.layer.masksToBounds = true
        
        imgGM.image = UIImage(named: "imgGM.png")
        imgGM.contentMode = .scaleAspectFit
        imgGM.layer.cornerRadius = 5
        imgGM.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    
    
}
