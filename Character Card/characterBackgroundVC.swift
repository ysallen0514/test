//
//  characterBackgroundVC.swift
//  Character Card
//
//  Created by user on 2017/7/18.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class characterBackgroundVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var list1 = [
        ["角色名：","年齡：","身高：","性別：","體態：","年代：","出生地：","居住地："],
        ["HP：","MP：","SAN：","LUCK：","狀態：","職業：","信用評級：","DB值：","移動值：","體格值："],
        ["力量：","體質：","敏捷：","外貌：","意志：","智力：","體型：","教育："]
    ]
    
    var skill = [String]() // 技能陣列，是list1的[3]
//    var background = ["性格","背景","重要之人","重要之物","心靈支柱"] // list1最後一組陣列[4]
    
    var lastlist = [[String]]() // list1陣列對應到的數值
    
    let skillTableView = playerVC()

    // 必須實作的方法：每一組有幾個 cell
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return list1[section].count
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            
            cell.name.text = list1[indexPath.section][indexPath.row]
            cell.lableContent.text = lastlist[indexPath.section][indexPath.row]
            return cell
//            switch indexPath.row {
//            case 1,2,3,4,5:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//
//                cell.name.text = list1[indexPath.section][indexPath.row]
//                cell.lableContent.text = lastlist[indexPath.section][indexPath.row]
//                return cell
//            case 0,6,7:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell1
//                
//                cell.name1.text = list1[indexPath.section][indexPath.row]
//                cell.content1.text = lastlist[indexPath.section][indexPath.row]
//                return cell
//            default:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell1
//                
//                cell.name1.text = list1[indexPath.section][indexPath.row]
//                cell.content1.text = lastlist[indexPath.section][indexPath.row]
//                return cell
//            }
        }else if indexPath.section == 1 {
            switch indexPath.row {
            case 0,1,2,3 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CustomCell2
                
                cell.name2.text = list1[indexPath.section][indexPath.row]
                cell.nowValue.text = lastlist[indexPath.section][indexPath.row]
                cell.maxValue.text = lastlist[indexPath.section][indexPath.row]
                return cell
            case 4,5,6,7,8,9 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
                
                cell.name.text = list1[indexPath.section][indexPath.row]
                cell.lableContent.text = lastlist[indexPath.section][indexPath.row]
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell1
                
                cell.name1.text = list1[indexPath.section][indexPath.row]
                cell.content1.text = lastlist[indexPath.section][indexPath.row]
                return cell
            }
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            
            cell.name.text = list1[indexPath.section][indexPath.row]
            cell.lableContent.text = lastlist[indexPath.section][indexPath.row]
            return cell
            
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            
            cell.name.text = list1[indexPath.section][indexPath.row]
            cell.lableContent.text = lastlist[indexPath.section][indexPath.row]
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CustomCell3
            
            cell.name3.text = list1[indexPath.section][indexPath.row]
            cell.bgText.text = lastlist[indexPath.section][indexPath.row]
            return cell
        }
        
    }
    
    
    
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return list1.count
    }
    
    // 每個 section 的標題
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = "基本資料"
        }else if section == 1{
            title = "基本狀態"
        }else if section == 2{
            title = "基礎能力"
        }else if section == 3{
            title = "技能"
        }
//        else if section == 4{
//            title = "人物背景"
//        }
        return title
    }
    
    
    
    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.showAlert()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        print(tempCard)
        skillTableView.insert(cardname: tempCard[0],cardAge: tempCard[1],cardTimeAge: tempCard[2])
        tempCard = []
        backPlayer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        let hp = String(Int(floor((Float(appDelegate.page3[1])! + Float(appDelegate.page3[6])!)*0.1)))
        let mp = String(Int(floor(Float(appDelegate.page3[4])!/5)))
        let san = appDelegate.page3[4]
        let luck = appDelegate.page3[8]
        
        let strValue = appDelegate.page3[0]
        let conValue = appDelegate.page3[1]
        let dexValue = appDelegate.page3[2]
        let appValue = appDelegate.page3[3]
        let powValue = appDelegate.page3[4]
        let intValue = appDelegate.page3[5]
        let sizeValue = appDelegate.page3[6]
        let eduValue = appDelegate.page3[7]
        
        var DB:String?
        var physique:String?
        if (Int(strValue)! + Int(sizeValue)!) < 65 {
            DB = "-2"
            physique = "-2"
        }else if (Int(strValue)! + Int(sizeValue)!) < 85 {
            DB = "-1"
            physique = "-1"
        }else if (Int(strValue)! + Int(sizeValue)!) < 125 {
            DB = "0"
            physique = "0"
        }else if (Int(strValue)! + Int(sizeValue)!) < 165 {
            DB = "+1D4"
            physique = "+1"
        }else if (Int(strValue)! + Int(sizeValue)!) < 205 {
            DB = "+1D6"
            physique = "+2"
        }
        
        
        var move:Int?
        var ageNerf:Int?
        var bodyNerf:Int?
        
        if Int(appDelegate.page1[1])! < 40 {
            ageNerf = 0
        }else if Int(appDelegate.page1[1])! < 50 {
            ageNerf = 1
        }else if Int(appDelegate.page1[1])! < 60 {
            ageNerf = 2
        }else if Int(appDelegate.page1[1])! < 70 {
            ageNerf = 3
        }else if Int(appDelegate.page1[1])! < 80 {
            ageNerf = 4
        }else{
            ageNerf = 5
        }
        
        switch appDelegate.page4[1] {
        case "胖到快不能自理","過度肥胖體型":
            bodyNerf = 3
        case "肥胖體型","巨無霸肥胖":
            bodyNerf = 2
        case "壯碩肥胖","隱性肥胖","豐滿身材（隱性肥胖）","金剛芭比":
            bodyNerf = 1
        case "瘦削結實體型","運動員體型","玲瓏結實","運動員身材":
            bodyNerf = -1
        default:
            bodyNerf = 0
        }
        
        
        if Int(dexValue)! < Int(sizeValue)! && Int(strValue)! < Int(sizeValue)! {
            if 7 - ageNerf! - bodyNerf! < 0 {
                move = 0
            }else{
                 move = 7 - ageNerf! - bodyNerf!
            }
        }else if Int(dexValue)! > Int(sizeValue)! && Int(strValue)! > Int(sizeValue)!{
            move = 9 - ageNerf! - bodyNerf!
        }else{
            move = 8 - ageNerf! - bodyNerf!
        }
        
        //lastlist[0][1][2]的數值
        lastlist = [
            [appDelegate.page2[0],appDelegate.page2[1],appDelegate.page4[0],appDelegate.page2[2],appDelegate.page4[1],appDelegate.page2[4],appDelegate.page2[5],appDelegate.page2[6]],
            [hp,mp,san,luck,"正常",appDelegate.page2[3],appDelegate.credit!,DB!,String(move!),physique!],
            [strValue,conValue,dexValue,appValue,powValue,intValue,sizeValue,eduValue]
        ]
    
        
        var lastskill = [String]()
//        var lastbackground = ["","","","",""] //lastlist[4]的內容，空白就夠了
        
        
        let url = Bundle.main.url(forResource: "skillsModel", withExtension:"json")
        if let data = try? Data(contentsOf: url!){
            if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:AnyObject] {
                for p in jsonObj["skills"] as! [AnyObject] {
                    skill.append("\(p["skill"] as! String)：") //讀取JSON中的技能，放入陣列skill
                }
            }
        }
        
//        for i in 1...skill.count{
//            lastskill.append(String(i)) //lastlist[3]的數值
        
        for i in 0..<appDelegate.page5.count{
            lastskill.append(appDelegate.page5[i]) //lastlist[3]的數值
        }
        
        
        
        list1.append(skill)
//        list1.append(background)
        lastlist.append(lastskill)
//        lastlist.append(lastbackground)
        
        
    }
    
    

}

