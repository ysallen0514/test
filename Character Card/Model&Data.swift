//
//  File.swift
//  Character Card
//
//  Created by user on 2017/7/19.
//  Copyright © 2017年 allen. All rights reserved.
//

import Foundation
import UIKit
//  事務所偵探
var careersRemarks = ["★選一","","","★","★","★","★","本","","","本","","","","","本","","","","","","本","","","","本","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","本","","","","","","","本","本","本","本","本","本","本","","","","","","","","","","","","","","","",""]
// var remark = ["★選一"]
var cardsName = ["露娜","丹尼爾","珍妮佛"] // [String]()
var cardsAge = ["13","51","24"] // [String]()
var cardsTimeAge = ["1960s","1920s","1920s"] // [String]()
var tempCard = [String]()
var careerPoints = 300
var normalPoints = 240
var careerPoint = [String]()
var normalPoint = [String]()
var skillsName = [String]() // [0] : 母語 ; [52] : 閃避
var skillsInitValue = [String]()
var selectedCareerPointsArray = [String]()
var usedPoints = [0,0]
// arraySkill[]? 職業點 : 興趣點 : 熟練度
var arraySkill:[[Int]] = [[],[],[]]
// i = 0 使用職業點, i = 1 使用興趣點, i = 3 信用評級
var i:Int?
// 信用點上下限
var creditLower = 0
var creditUpper = 99
// 信用評級是否選擇
var isUsed = false

var creditArray:[[Int]] = [[],[]]

var whichCareer = 0


class ageModel {
    var age = ""
    
    init(age: String) {
        self.age = age
    }
}

class genderModel {
    var gender = ""
    
    init(gender: String) {
        self.gender = gender
    }
}

class careerModel {
    var career = ""
    
    init(career: String) {
        self.career = career
    }
}

class timeAgeModel {
    var timeAge = ""
    
    init(timeAge: String) {
        self.timeAge = timeAge
    }
}

class careerPointModel {
    var careerPoint = ""
    
    init(careerPoint: String){
        self.careerPoint = careerPoint
    }
}

class normalPointModel {
    var normalPoint = ""
    
    init(normalPoint: String){
        self.normalPoint = normalPoint
    }
}

class creditLevelModel {
    var creditLevel = ""
    
    init(creditLevel: String){
        self.creditLevel = creditLevel
    }
}

class setData {
    class func getAgeData() -> [ageModel] {
        var data = [ageModel]()
        data.append(ageModel(age: "請選擇你要的年齡"))
        for i in 13...89 {
            data.append(ageModel(age: "\(i)"))
        }
        return data
    }
    
    class func getGenderData() -> [genderModel] {
        var data = [genderModel]()
        data.append(genderModel(gender: "請選擇你要的性別"))
        data.append(genderModel(gender: "男"))
        data.append(genderModel(gender: "女"))
        return data
    }
    
    class func getCareerData() -> [careerModel] {
        var data = [careerModel]()
        data.append(careerModel(career: "探險家"))
        data.append(careerModel(career: "藝術家"))
        data.append(careerModel(career: "運動員"))
        data.append(careerModel(career: "作家"))
        data.append(careerModel(career: "神職人員"))
        data.append(careerModel(career: "罪犯"))
        data.append(careerModel(career: "業餘藝術愛好者"))
        return data
    }
    
    class func getTimeAgeData() -> [timeAgeModel] {
        var data = [timeAgeModel]()
        data.append(timeAgeModel(timeAge: "請選擇你要的年代"))
        data.append(timeAgeModel(timeAge: "1920s"))
        data.append(timeAgeModel(timeAge: "1960s"))
        data.append(timeAgeModel(timeAge: "現代"))
        return data
    }
    
    class func getCareerPointData(_ num:Int,_ initPoint:Int) -> [careerPointModel] {
        var data = [careerPointModel]()
        data.append(careerPointModel(careerPoint: "請選擇你要使用的職業點數"))
        for i in 0...99 - initPoint - num {
            //for i in 0...99 - num {
            data.append(careerPointModel(careerPoint: "\(i)"))
        }
        return data
    }
    
    class func getNormalPointData(_ num:Int,_ initPoint:Int) -> [normalPointModel] {
        var data = [normalPointModel]()
        data.append(normalPointModel(normalPoint: "請選擇你要使用的興趣點數"))
        for i in 0...99 - initPoint - num {
            //for i in 0...99 - num {
            data.append(normalPointModel(normalPoint: "\(i)"))
        }
        return data
    }
    
    class func getCreditLevelData() -> [creditLevelModel] {
        var data = [creditLevelModel]()
        data.append(creditLevelModel(creditLevel: "請選擇你的信用評級"))
        for i in creditLower...creditUpper {
            data.append(creditLevelModel(creditLevel: "\(i)"))
        }
        return data
    }
}


extension UILabel {
    
    func createLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textAlignment = NSTextAlignment.natural
        return label
    }
}

extension UITextField {
    
    func createTextField(size: CGFloat) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.boldSystemFont(ofSize: size)
        return textField
    }
}

extension UIView {
    func addConstraintV(_ labelName: UIView) {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": labelName]))
    }
}

extension UITableViewController {
    func insert(cardname: String, cardAge: String, cardTimeAge: String) {
        cardsName.append(cardname)
        cardsAge.append(cardAge)
        cardsTimeAge.append(cardTimeAge)
        
        let insertIndexPath = NSIndexPath(row: cardsName.count - 1, section: 0)
        tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)
        tableView.reloadData()
    }
}


