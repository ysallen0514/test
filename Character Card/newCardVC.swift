//
//  newCardVC.swift
//  Character Card
//
//  Created by user on 2017/7/18.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class newCardVC: UIViewController {
    
    @IBOutlet weak var UIBarBtn: UIButton!
    @IBAction func descripBtn(_ sender: Any) {
        descripAlert(title: "說明", msg: "一、d是dice(骰子)的意思\n\n二、3d6代表「3次」的「6面骰」相加\n\n三、因此最小為3，最高為18\n\n四、2d6+6最小為8，最高為18")
        
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var titleLabel3: UILabel!
    
   
    var fullSize:CGSize!
    
    @IBOutlet weak var D01: UILabel!
    @IBOutlet weak var D02: UILabel!
    @IBOutlet weak var D03: UILabel!
    @IBOutlet weak var D04: UILabel!
    @IBOutlet weak var D05: UILabel!
    @IBOutlet weak var D06: UILabel!
    @IBOutlet weak var D07: UILabel!
    @IBOutlet weak var D08: UILabel!
    @IBOutlet weak var D09: UILabel!
    @IBOutlet weak var D10: UILabel!
    @IBOutlet weak var D11: UILabel!
    @IBOutlet weak var D12: UILabel!
    @IBOutlet weak var D13: UILabel!
    @IBOutlet weak var D14: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func btn(_ sender: Any) {
        createDice() // 叫出creatDICE方法
        btn.isEnabled = false
        
    }
    
    //一個按鈕全做完
    private func createDice() {
        var sevenDICE:Array<Int> = [] // 摋七次的那組
        var fiveDICE:Array<Int> = [] // 摋五次那組
        var twoDICE:Array<Int> = [] // 摋兩次那組
        var temp1:Int
        var temp2:Int
        var temp3:Int
        
        while sevenDICE.count < 7 {
            temp1 = Int(arc4random_uniform(6)+arc4random_uniform(6)+arc4random_uniform(6))+3
            sevenDICE.append(temp1)
        }
        while fiveDICE.count < 5 {
            temp2 = Int(arc4random_uniform(6)+arc4random_uniform(6))+8
            fiveDICE.append(temp2)
        }
        while twoDICE.count < 2 {
            temp3 = Int(arc4random_uniform(6)+arc4random_uniform(6)+arc4random_uniform(6))+3
            twoDICE.append(temp3)
        }
        
        D01.text = String(sevenDICE[0])
        D02.text = String(sevenDICE[1])
        D03.text = String(sevenDICE[2])
        D04.text = String(sevenDICE[3])
        D05.text = String(sevenDICE[4])
        D06.text = String(sevenDICE[5])
        D07.text = String(sevenDICE[6])
        D08.text = String(fiveDICE[0])
        D09.text = String(fiveDICE[1])
        D10.text = String(fiveDICE[2])
        D11.text = String(fiveDICE[3])
        D12.text = String(fiveDICE[4])
        D13.text = String(twoDICE[0])
        D14.text = String(twoDICE[1])
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        self.showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        fullSize = UIScreen.main.bounds.size
        
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.masksToBounds = true
        titleLabel2.layer.cornerRadius = 5
        titleLabel2.layer.masksToBounds = true
        titleLabel3.layer.cornerRadius = 5
        titleLabel3.layer.masksToBounds = true
        
        UIBarBtn.layer.cornerRadius = 5
        UIBarBtn.layer.masksToBounds = true
        
        D01.text = ""
        D02.text = ""
        D03.text = ""
        D04.text = ""
        D05.text = ""
        D06.text = ""
        D07.text = ""
        D08.text = ""
        D09.text = ""
        D10.text = ""
        D11.text = ""
        D12.text = ""
        D13.text = ""
        D14.text = ""
        
        
        
        D01.layer.cornerRadius = 10
        D01.layer.masksToBounds = true
        D01.layer.borderColor = UIColor.black.cgColor
        D01.layer.borderWidth = 3
        D01.textAlignment = .center
        D01.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.2)
        D01.bounds.size = CGSize(width: 30 ,height: 30)
        
        D02.layer.cornerRadius = 10
        D02.layer.masksToBounds = true
        D02.layer.borderColor = UIColor.black.cgColor
        D02.layer.borderWidth = 3
        D02.textAlignment = .center
        D02.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.2)
        D02.bounds.size = CGSize(width: 30 ,height: 30)
        
        D03.layer.cornerRadius = 10
        D03.layer.masksToBounds = true
        D03.layer.borderColor = UIColor.black.cgColor
        D03.layer.borderWidth = 3
        D03.textAlignment = .center
        D03.center = CGPoint(x: fullSize.width*0.6, y: fullSize.height*0.2)
        D03.bounds.size = CGSize(width: 30 ,height: 30)
        
        D04.layer.cornerRadius = 10
        D04.layer.masksToBounds = true
        D04.layer.borderColor = UIColor.black.cgColor
        D04.layer.borderWidth = 3
        D04.textAlignment = .center
        D04.center = CGPoint(x: fullSize.width*0.8, y: fullSize.height*0.2)
        D04.bounds.size = CGSize(width: 30 ,height: 30)
        
        D05.layer.cornerRadius = 10
        D05.layer.masksToBounds = true
        D05.layer.borderColor = UIColor.black.cgColor
        D05.layer.borderWidth = 3
        D05.textAlignment = .center
        D05.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.25)
        D05.bounds.size = CGSize(width: 30 ,height: 30)
        
        D06.layer.cornerRadius = 10
        D06.layer.masksToBounds = true
        D06.layer.borderColor = UIColor.black.cgColor
        D06.layer.borderWidth = 3
        D06.textAlignment = .center
        D06.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.25)
        D06.bounds.size = CGSize(width: 30 ,height: 30)
        
        D07.layer.cornerRadius = 10
        D07.layer.masksToBounds = true
        D07.layer.borderColor = UIColor.black.cgColor
        D07.layer.borderWidth = 3
        D07.textAlignment = .center
        D07.center = CGPoint(x: fullSize.width*0.6, y: fullSize.height*0.25)
        D07.bounds.size = CGSize(width: 30 ,height: 30)
        
        D08.layer.cornerRadius = 10
        D08.layer.masksToBounds = true
        D08.layer.borderColor = UIColor.black.cgColor
        D08.layer.borderWidth = 3
        D08.textAlignment = .center
        D08.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.375)
        D08.bounds.size = CGSize(width: 30 ,height: 30)
        
        D09.layer.cornerRadius = 10
        D09.layer.masksToBounds = true
        D09.layer.borderColor = UIColor.black.cgColor
        D09.layer.borderWidth = 3
        D09.textAlignment = .center
        D09.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.375)
        D09.bounds.size = CGSize(width: 30 ,height: 30)
        
        D10.layer.cornerRadius = 10
        D10.layer.masksToBounds = true
        D10.layer.borderColor = UIColor.black.cgColor
        D10.layer.borderWidth = 3
        D10.textAlignment = .center
        D10.center = CGPoint(x: fullSize.width*0.6, y: fullSize.height*0.375)
        D10.bounds.size = CGSize(width: 30 ,height: 30)
        
        D11.layer.cornerRadius = 10
        D11.layer.masksToBounds = true
        D11.layer.borderColor = UIColor.black.cgColor
        D11.layer.borderWidth = 3
        D11.textAlignment = .center
        D11.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.425)
        D11.bounds.size = CGSize(width: 30 ,height: 30)
        
        D12.layer.cornerRadius = 10
        D12.layer.masksToBounds = true
        D12.layer.borderColor = UIColor.black.cgColor
        D12.layer.borderWidth = 3
        D12.textAlignment = .center
        D12.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.425)
        D12.bounds.size = CGSize(width: 30 ,height: 30)
        
        D13.layer.cornerRadius = 10
        D13.layer.masksToBounds = true
        D13.layer.borderColor = UIColor.black.cgColor
        D13.layer.borderWidth = 3
        D13.textAlignment = .center
        D13.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.55)
        D13.bounds.size = CGSize(width: 30 ,height: 30)

        D14.layer.cornerRadius = 10
        D14.layer.masksToBounds = true
        D14.layer.borderColor = UIColor.black.cgColor
        D14.layer.borderWidth = 3
        D14.textAlignment = .center
        D14.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.55)
        D14.bounds.size = CGSize(width: 30 ,height: 30)

        
        
        
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if D01.text! == "" {
            wrongAlert(title: "錯誤", msg: "您可能還沒按下擲骰子按鈕")
        }
        
        if segue.identifier == "gotorole"{
            let application = UIApplication.shared
            let appDelegate = application.delegate as! AppDelegate
            appDelegate.page1 = [D01.text!,D02.text!,D03.text!,D04.text!,D05.text!,D06.text!,D07.text!,D08.text!,D09.text!,D10.text!,D11.text!,D12.text!,D13.text!,D14.text!]
        }
    }

        
    
    
    
    
}
