//
//  adjustVC.swift
//  Character Card
//
//  Created by falock1007 on 2017/8/14.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class adjustVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var adTableView: UITableView!
    
    var nameArray = [String]()
    var theValueArray = [String]()
    var adValueArray = [String]()
    var lastValueArray = [String]()
    
    // 每個 section 的標題
    
    var age:Int?
    
    var nerfAge:String?
    
    
    // 必須實作的方法：每一組有幾個 cell
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! adjustCell
            cell.name.text = nameArray[indexPath.row]
            cell.theValue.text = theValueArray[indexPath.row]
            cell.adValue.text = adValueArray[indexPath.row]
            cell.lastValue.text = lastValueArray[indexPath.row]
            return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        age = Int(appDelegate.page2[1])!
        
        let str = Int(appDelegate.page3[0])! * 5
        let con = Int(appDelegate.page3[1])! * 5
        let dex = Int(appDelegate.page3[2])! * 5
        let app = Int(appDelegate.page3[3])! * 5
        let pow = Int(appDelegate.page3[4])! * 5
        let int = Int(appDelegate.page3[5])! * 5
        let size = Int(appDelegate.page3[6])! * 5
        let edu = Int(appDelegate.page3[7])! * 5
        let luck = Int(appDelegate.page3[8])! * 5
        
        appDelegate.page3[0] = String(str)
        appDelegate.page3[1] = String(con)
        appDelegate.page3[2] = String(dex)
        appDelegate.page3[3] = String(app)
        appDelegate.page3[4] = String(pow)
        appDelegate.page3[5] = String(int)
        appDelegate.page3[6] = String(size)
        appDelegate.page3[7] = String(edu)
        appDelegate.page3[8] = String(luck)

        
        if age! < 15 {
            nameArray = ["力量","體型","教育","意志"]
            theValueArray = [String(str),String(size),String(edu),String(pow)]
            adValueArray = ["-5","-10","-10","-10"]
            lastValueArray = [String(str-5),String(size-10),String(edu-10),String(pow-10)]
            if Int(lastValueArray[0])! < 15 {
                lastValueArray[0] = "15"
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 40 {
                lastValueArray[1] = "40"
                appDelegate.page3[6] = "40"
            }else{
                appDelegate.page3[6] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 40 {
                lastValueArray[2] = "40"
                appDelegate.page3[7] = "40"
            }else{
                appDelegate.page3[7] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                lastValueArray[3] = "15"
                appDelegate.page3[4] = "15"
            }else{
                appDelegate.page3[4] = lastValueArray[3]
            }
            
        }else if age! < 19 {
            nameArray = ["力量","體型","教育","意志"]
            theValueArray = [String(str),String(size),String(edu),String(pow)]
            adValueArray = ["-3","-3","-5","-5"]
            lastValueArray = [String(str-3),String(size-3),String(edu-5),String(pow-5)]
            if Int(lastValueArray[0])! < 15 {
                lastValueArray[0] = "15"
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 40 {
                lastValueArray[1] = "40"
                appDelegate.page3[6] = "40"
            }else{
                appDelegate.page3[6] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 40 {
                lastValueArray[2] = "40"
                appDelegate.page3[7] = "40"
            }else{
                appDelegate.page3[7] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                lastValueArray[3] = "15"
                appDelegate.page3[4] = "15"
            }else{
                appDelegate.page3[4] = lastValueArray[3]
            }
        }else if age! < 40 {
            nameArray = ["教育"]
            theValueArray = [String(edu)]
            adValueArray = ["3"]
            lastValueArray = [String(edu+3)]
            appDelegate.page3[7] = lastValueArray[0]
            
        }else if age! < 50 {
            nameArray = ["力量","體質","敏捷","外貌","教育"]
            theValueArray = [String(str),String(con),String(dex),String(app),String(edu)]
            adValueArray = ["-2","-2","-2","-10","6"]
            lastValueArray = [String(str-2),String(con-2),String(dex-2),String(app-10),String(edu+6)]
            if Int(lastValueArray[0])! < 15 {
                lastValueArray[0] = "15"
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 15 {
                lastValueArray[1] = "15"
                appDelegate.page3[1] = "15"
            }else{
                appDelegate.page3[1] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 15 {
                lastValueArray[2] = "15"
                appDelegate.page3[2] = "15"
            }else{
                appDelegate.page3[2] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                lastValueArray[3] = "15"
                appDelegate.page3[3] = "15"
            }else{
                appDelegate.page3[3] = lastValueArray[3]
            }
            if Int(lastValueArray[4])! > 99 {
                lastValueArray[4] = "99"
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[4]
            }
            
        }else if age! < 60 {
            nameArray = ["力量","體質","敏捷","外貌","教育"]
            theValueArray = [String(str),String(con),String(dex),String(app),String(edu)]
            adValueArray = ["-3","-3","-3","-10","9"]
            lastValueArray = [String(str-3),String(con-3),String(dex-3),String(app-10),String(edu+9)]
            if Int(lastValueArray[0])! < 15 {
                lastValueArray[0] = "15"
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 15 {
                lastValueArray[1] = "15"
                appDelegate.page3[1] = "15"
            }else{
                appDelegate.page3[1] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 15 {
                lastValueArray[2] = "15"
                appDelegate.page3[2] = "15"
            }else{
                appDelegate.page3[2] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                lastValueArray[3] = "15"
                appDelegate.page3[3] = "15"
            }else{
                appDelegate.page3[3] = lastValueArray[3]
            }
            if Int(lastValueArray[4])! > 99 {
                lastValueArray[4] = "99"
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[4]
            }
        }else if age! < 70 {
            nameArray = ["力量","體質","敏捷","外貌","體型","教育"]
            theValueArray = [String(str),String(con),String(dex),String(app),String(size),String(edu)]
            adValueArray = ["-7","-7","-7","-15","-5","12"]
            lastValueArray = [String(str-7),String(con-7),String(dex-7),String(app-15),String(size-5),String(edu+12)]
            if Int(lastValueArray[0])! < 15 {
                lastValueArray[0] = "15"
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 15 {
                lastValueArray[1] = "15"
                appDelegate.page3[1] = "15"
            }else{
                appDelegate.page3[1] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 15 {
                lastValueArray[2] = "15"
                appDelegate.page3[2] = "15"
            }else{
                appDelegate.page3[2] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                lastValueArray[3] = "15"
                appDelegate.page3[3] = "15"
            }else{
                appDelegate.page3[3] = lastValueArray[3]
            }
            if Int(lastValueArray[4])! < 40 {
                lastValueArray[4] = "40"
                appDelegate.page3[6] = "40"
            }else{
                appDelegate.page3[6] = lastValueArray[4]
            }

        }else if age! < 80 {
            nameArray = ["力量","體質","敏捷","外貌","體型","教育"]
            theValueArray = [String(str),String(con),String(dex),String(app),String(size),String(edu)]
            adValueArray = ["-13","-13","-13","-20","-10","15"]
            lastValueArray = [String(str-13),String(con-13),String(dex-13),String(app-30),String(size-10),String(edu+15)]
            if Int(lastValueArray[0])! < 15 {
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 15 {
                appDelegate.page3[1] = "15"
            }else{
                appDelegate.page3[1] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 15 {
                appDelegate.page3[2] = "15"
            }else{
                appDelegate.page3[2] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                appDelegate.page3[3] = "15"
            }else{
                appDelegate.page3[3] = lastValueArray[3]
            }
            if Int(lastValueArray[4])! > 99 {
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[4]
            }
            if Int(lastValueArray[5])! > 99 {
                lastValueArray[5] = "99"
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[5]
            }

        }else if age! < 90 {
            nameArray = ["力量","體質","敏捷","外貌","體型","教育"]
            theValueArray = [String(str),String(con),String(dex),String(app),String(size),String(edu)]
            adValueArray = ["-27","-27","-27","-25","-15","18"]
            lastValueArray = [String(str-27),String(con-27),String(dex-27),String(app-25),String(size-15),String(edu+18)]
            if Int(lastValueArray[0])! < 15 {
                appDelegate.page3[0] = "15"
            }else{
                appDelegate.page3[0] = lastValueArray[0]
            }
            if Int(lastValueArray[1])! < 15 {
                appDelegate.page3[1] = "15"
            }else{
                appDelegate.page3[1] = lastValueArray[1]
            }
            if Int(lastValueArray[2])! < 15 {
                appDelegate.page3[2] = "15"
            }else{
                appDelegate.page3[2] = lastValueArray[2]
            }
            if Int(lastValueArray[3])! < 15 {
                appDelegate.page3[3] = "15"
            }else{
                appDelegate.page3[3] = lastValueArray[3]
            }
            if Int(lastValueArray[4])! > 99 {
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[4]
            }
            if Int(lastValueArray[5])! > 99 {
                lastValueArray[5] = "99"
                appDelegate.page3[7] = "99"
            }else{
                appDelegate.page3[7] = lastValueArray[5]
            }        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotosize"{
            let application = UIApplication.shared
            let appDelegate = application.delegate as! AppDelegate
            
            if appDelegate.page3[0] == "90" && appDelegate.page3[6] == "40" {
                wrongAlert(title: "注意", msg: "您的力量數值高過體型數值太多\n將做體型加5，力量減5的調整")
            }else if appDelegate.page3[0] == "15" && appDelegate.page3[6] == "90" {
                wrongAlert(title: "注意", msg: "您的體型數值高過體型數值太多\n將做力量加5，體型減5的調整")
            }
            
            
            
            
        }
    }
}

    class adjustCell: UITableViewCell {
    
        @IBOutlet weak var name: UILabel!
        @IBOutlet weak var theValue: UILabel!
        @IBOutlet weak var adValue: UILabel!
        @IBOutlet weak var lastValue: UILabel!
        
    override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
    }
    
    
}



