//
//  sizeCorrectionVC.swift
//  Character Card
//
//  Created by user on 2017/7/18.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class sizeCorrectionVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var UIBarbtn: UIButton! //說明
    
    @IBOutlet weak var hTitle: UILabel!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var Picker01: UIPickerView! // pickerView
    
    var height = [String]()
    var muscle = [String]()
    var jsonH = [String]()
    var jsonM = [String]()
    var gender:String?
    var fullsize:Int?
    
    @IBOutlet weak var dsTitle: UILabel!
    @IBOutlet weak var descriSize: UILabel! //體態屬性補正
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return height.count
        }else{
            return muscle.count
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return height[row]
        }else{
            return muscle[row]
        }
        
    }
    @IBOutlet weak var fatTitle: UILabel!
    
    @IBOutlet weak var bodyTitle: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var labelx: UILabel!
    @IBOutlet weak var labely: UILabel!
    @IBOutlet weak var body: UILabel!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            if height[row] == "請選一個數字"{
                label.text = "尚未選擇"
                labelx.text = ""
            }else{
                label.text = jsonH[Int(height[row])!-1]
                labelx.text = height[row]
            }
        }else{
            if muscle[row] == "請選一個數字"{
                label2.text = "尚未選擇"
                labely.text = ""
            }else{
                label2.text = jsonM[Int(muscle[row])!-1]
                labely.text = muscle[row]
            }
        }
        
        var bodyx = 0
        var bodyyB = 0
        var bodyyG = 0
        
        if labelx.text == "" || labely.text == "" {
            label3.text = ""
            body.text = ""
        }else{
            var sum = Int(labelx.text!)! + Int(labely.text!)!
            var fat = Int(fullsize!) - sum
            
            if Int(labely.text!)! < 17{
                bodyx = 1
            }else if Int(labely.text!)!>=17 && Int(labely.text!)!<32 {
                bodyx = 2
            }else {
                bodyx = 3
            }
            
            if gender == "男" {
                if fat > 40 {
                    label3.text = "實在太胖了，請調整數值"
                    body.text = ""
                    descriSize.text = ""
                }else if fat < 3{
                    label3.text = "體脂肪太少了，請調整數值"
                    body.text = ""
                    descriSize.text = ""
                }else{
                    label3.text = "\(fat)%"
                    if fat < 12{
                        bodyyB = 1
                    }else if fat >= 12 && fat < 23{
                        bodyyB = 2
                    }else if fat >= 23 && fat < 34{
                        bodyyB = 3
                    }else{
                        bodyyB = 4
                    }
                }
            }else if gender == "女"{
                if fat + 7 > 45{
                    label3.text = "實在太胖了，請調整數值"
                    body.text = ""
                    descriSize.text = ""
                }else if fat + 7 < 10 {
                    label3.text = "體脂肪太少了，請調整數值"
                    body.text = ""
                    descriSize.text = ""
                }else{
                    label3.text = "\(fat + 7)%"
                    if (fat + 7) < 12{
                        bodyyG = 1
                    }else if fat + 7 >= 12 && fat + 7 < 23{
                        bodyyG = 2
                    }else if fat + 7 >= 23 && fat + 7 < 34{
                        bodyyG = 3
                    }else{
                        bodyyG = 4
                    }
                    
                }
            }
            
            if gender == "男" {
                if bodyx == 1 {
                    if bodyyB == 1{
                        body.text = "瘦削體型"
                        descriSize.text = ""
                    }else if bodyyB == 2{
                        body.text = "運動不足"
                        descriSize.text = ""
                    }else if bodyyB == 3{
                        body.text = "隱性肥胖"
                        descriSize.text = "敏捷減5"
                    }else if bodyyB == 4{
                        body.text = "胖到快不能自理"
                        descriSize.text = "敏捷減40，外貌減20"
                    }
                }else if bodyx == 2 {
                    if bodyyB == 1{
                        body.text = "瘦削結實體型"
                        descriSize.text = "敏捷加10"
                    }else if bodyyB == 2{
                        body.text = "標準體型"
                        descriSize.text = ""
                    }else if bodyyB == 3{
                        body.text = "肥胖體型"
                        descriSize.text = "敏捷減20，外貌減10"
                    }else if bodyyB == 4{
                        body.text = "過度肥胖體型"
                        descriSize.text = "敏捷減30，外貌減10"
                    }
                }else if bodyx == 3 {
                    if bodyyB == 1{
                        body.text = "運動員體型"
                        descriSize.text = "力量加5，敏捷加5"
                    }else if bodyyB == 2{
                        body.text = "健美體型"
                        descriSize.text = "力量加5"
                    }else if bodyyB == 3{
                        body.text = "壯碩肥胖"
                        descriSize.text = "力量加10，敏捷減10"
                    }else if bodyyB == 4{
                        body.text = "巨無霸肥胖"
                        descriSize.text = "力量加15，敏捷減15"
                    }
                }
            }else if gender == "女" {
                if bodyx == 1 {
                    if bodyyG == 1{
                        body.text = "纖細身材"
                        descriSize.text = ""
                    }else if bodyyG == 2{
                        body.text = "豐滿身材（運動不足）"
                        descriSize.text = ""
                    }else if bodyyG == 3{
                        body.text = "豐滿身材（隱性肥胖）"
                        descriSize.text = "敏捷減5"
                    }else if bodyyG == 4{
                        body.text = "胖到快不能自理"
                        descriSize.text = "敏捷減40，外貌減20"
                    }
                }else if bodyx == 2 {
                    if bodyyG == 1{
                        body.text = "玲瓏結實"
                        descriSize.text = "敏捷加10"
                    }else if bodyyG == 2{
                        body.text = "模特兒身材"
                        descriSize.text = ""
                    }else if bodyyG == 3{
                        body.text = "肥胖體型"
                        descriSize.text = "敏捷減20，外貌減10"
                    }else if bodyyG == 4{
                        body.text = "過度肥胖體型"
                        descriSize.text = "敏捷減30，外貌減10"
                    }
                }else if bodyx == 3 {
                    if bodyyG == 1{
                        body.text = "運動員身材"
                        descriSize.text = "力量加5，敏捷加5"
                    }else if bodyyG == 2{
                        body.text = "結實豐滿"
                        descriSize.text = "力量加5"
                    }else if bodyyG == 3{
                        body.text = "金剛芭比"
                        descriSize.text = "力量加10，敏捷減10"
                    }else if bodyyG == 4{
                        body.text = "巨無霸肥胖"
                        descriSize.text = "力量加15，敏捷減15"
                    }
                }
            }
        }
    }
    
        
    var fullSize:CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        fullSize = UIScreen.main.bounds.size
        
        UIBarbtn.layer.cornerRadius = 5
        UIBarbtn.layer.masksToBounds = true
        
        
       

        hTitle.layer.cornerRadius = 5
        hTitle.layer.masksToBounds = true
        hTitle.center = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.05)
        
        mTitle.layer.cornerRadius = 5
        mTitle.layer.masksToBounds = true
        mTitle.center = CGPoint(x: fullSize.width*0.7, y: fullSize.height*0.05)
        
        Picker01.layer.cornerRadius = 5
        Picker01.layer.masksToBounds = true
        Picker01.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.25)
        
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.center = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.45)
        
        label2.layer.cornerRadius = 5
        label2.layer.masksToBounds = true
        label2.center = CGPoint(x: fullSize.width*0.7, y: fullSize.height*0.45)
        
        fatTitle.layer.cornerRadius = 5
        fatTitle.layer.masksToBounds = true
        fatTitle.center = CGPoint(x: fullSize.width*0.25, y: fullSize.height*0.5)

        label3.layer.cornerRadius = 5
        label3.layer.masksToBounds = true
        label3.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.55)
        label3.bounds.size = CGSize(width: fullSize.width*0.85, height: fullSize.height*0.03)

        bodyTitle.layer.cornerRadius = 5
        bodyTitle.layer.masksToBounds = true
        bodyTitle.center = CGPoint(x: fullSize.width*0.25, y: fullSize.height*0.6)

        body.layer.cornerRadius = 5
        body.layer.masksToBounds = true
        body.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.65)
        body.bounds.size = CGSize(width: fullSize.width*0.85, height: fullSize.height*0.03)

        
        dsTitle.layer.cornerRadius = 5
        dsTitle.layer.masksToBounds = true
        dsTitle.center = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.7)
        
        descriSize.layer.cornerRadius = 5
        descriSize.layer.masksToBounds = true
        descriSize.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.75)
        body.bounds.size = CGSize(width: fullSize.width*0.85, height: fullSize.height*0.03)

        
        
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        
        gender = appDelegate.page2[2]
        
        label.text = "尚未選擇"
        label2.text = "尚未選擇"
        label3.text = ""
        body.text = ""
        labelx.text = ""
        labely.text = ""
        descriSize.text = ""
        
        var str = Int(floor(Float(appDelegate.page3[0])!*0.2))
        var newstr = Int(floor(Double(str)*2.5))
        
        var size = Int(floor(Float(appDelegate.page3[6])!*0.2))
        var newsize = Int(floor(Double(size)*2.5))
        
        fullsize = Int(appDelegate.page3[6])
        
        
        muscle.append("請選一個數字")
        while str <= newstr && str <= 40 {
            muscle.append(String(str))
            str += 1
        }
        height.append("請選一個數字")
        while size <= newsize && size <= 40 {
            height.append(String(size))
            size += 1
        }
        
        let url = Bundle.main.url(forResource: "height&muscle", withExtension:"json")
        if let data = try? Data(contentsOf: url!){
            if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                
                for p in jsonObj as! [[String: AnyObject]]{
                    jsonH.append("\(p["身高"] as! String)")
                    jsonM.append("\(p["肌肉"] as! String)")
                    
                }
            }
            
        }
        
    }
    
    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

    @IBAction func cancelBtn(_ sender: Any) {
        
        self.showAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoskills"{
            let application = UIApplication.shared
            let appDelegate = application.delegate as! AppDelegate
            if body.text == "" || body.text == "x"{
                wrongAlert(title: "錯誤", msg: "請分配數值直到正確為止")
            }else{
            appDelegate.page4 = [label.text!,body.text!]
                switch descriSize.text! {
                case "敏捷減5" :
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-5)
                        if Int(appDelegate.page3[2])! < 15 {
                            appDelegate.page3[2] = "15"
                        }
                case "敏捷減40，外貌減20" :
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-40)
                        if Int(appDelegate.page3[2])! < 15 {
                            appDelegate.page3[2] = "15"
                        }
                    appDelegate.page3[3] = String(Int(appDelegate.page3[3])!-20)
                        if Int(appDelegate.page3[3])! < 15 {
                            appDelegate.page3[3] = "15"
                        }
                case "敏捷加10" :
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!+10)
                        if Int(appDelegate.page3[2])! > 99 {
                            appDelegate.page3[2] = "99"
                        }
                case "敏捷減20，外貌減10" :
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-20)
                        if Int(appDelegate.page3[2])! < 15 {
                            appDelegate.page3[2] = "15"
                        }
                    appDelegate.page3[3] = String(Int(appDelegate.page3[3])!-10)
                        if Int(appDelegate.page3[3])! < 15 {
                            appDelegate.page3[3] = "15"
                        }
                case "敏捷減30，外貌減10":
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-30)
                        if Int(appDelegate.page3[2])! < 15 {
                            appDelegate.page3[2] = "15"
                        }
                    appDelegate.page3[3] = String(Int(appDelegate.page3[3])!-10)
                        if Int(appDelegate.page3[3])! < 15 {
                            appDelegate.page3[3] = "15"
                        }
                case "力量加5，敏捷加5" :
                    appDelegate.page3[0] = String(Int(appDelegate.page3[0])!+5)
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!+5)
                case "力量加5":
                    appDelegate.page3[0] = String(Int(appDelegate.page3[0])!+5)
                case "力量加10，敏捷減10" :
                    appDelegate.page3[0] = String(Int(appDelegate.page3[0])!+10)
                    if Int(appDelegate.page3[0])! > 99 {
                        appDelegate.page3[0] = "99"
                    }
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-10)
                    if Int(appDelegate.page3[2])! < 15 {
                        appDelegate.page3[2] = "15"
                    }
                case "力量加15，敏捷減15" :
                    appDelegate.page3[0] = String(Int(appDelegate.page3[0])!+15)
                    if Int(appDelegate.page3[0])! > 99 {
                        appDelegate.page3[0] = "99"
                    }
                    appDelegate.page3[2] = String(Int(appDelegate.page3[2])!-15)
                    if Int(appDelegate.page3[2])! < 15 {
                        appDelegate.page3[2] = "15"
                    }
                default:
                    print("nothing")
                }
        }
    }
}
}
