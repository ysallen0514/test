//
//  skillTableView.swift
//  Character Card
//
//  Created by user on 2017/8/7.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class skillCell: UITableViewCell {
    
    var careerPointPicker =  UIPickerView()
    var careerPointModelPicker: CareerPointModelPicker?
    
    var normalPointPicker =  UIPickerView()
    var normalPointModelPicker: NormalPointModelPicker?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let skillNameLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let skillRemarkLabel:UILabel = {
        let label = UILabel().createLabel(size: 15)
        label.text = "本"
        return label
    }()
    
    let skillInitLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    var careerPointText:UITextField = {
        let textfield = UITextField()
        textfield.text = "0"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textAlignment = NSTextAlignment.center
        
        return textfield
    }()
    
    let normalPointText:UITextField = {
        let textfield = UITextField()
        textfield.text = "0"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textAlignment = NSTextAlignment.center
        
        return textfield
    }()
    
    let totalPointsLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    func createCareerPointPicker(_ selectedValue:Int,_ initValue:Int) {
        
        careerPointModelPicker = CareerPointModelPicker()
        careerPointModelPicker?.careerPointModelData = setData.getCareerPointData(0,initValue)
        
        careerPointPicker.dataSource = careerPointModelPicker
        careerPointPicker.delegate = careerPointModelPicker
        
        careerPointText.inputView = careerPointPicker
        careerPointPicker.backgroundColor = .clear
    }
    
    func createNormalPointPicker(_ selectedValue:Int,_ initValue:Int) {
        normalPointModelPicker = NormalPointModelPicker()
        normalPointModelPicker?.normalPointModelData = setData.getNormalPointData(0,initValue)
        
        normalPointPicker.dataSource = normalPointModelPicker
        normalPointPicker.delegate = normalPointModelPicker
        
        normalPointText.inputView = normalPointPicker
        normalPointPicker.backgroundColor = .clear
    }
    
    func changeData(_ initValue:Int) {
        normalPointModelPicker?.normalPointModelData = setData.getNormalPointData(Int(careerPointText.text!)!,initValue)
        careerPointModelPicker?.careerPointModelData = setData.getCareerPointData(Int(normalPointText.text!)!,initValue)
    }
    
    func tapSelect() {
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate

        self.changeData(Int(skillInitLabel.text!)!)
        totalPointsLabel.text = "\(totalPoint())"
        arraySkill[2][totalPointsLabel.tag] = totalPoint()
        
        appDelegate.page5[totalPointsLabel.tag] = String(arraySkill[2][totalPointsLabel.tag])
        
    }
    
    func totalPoint() -> Int {
        let sum = Int(normalPointText.text!)! + Int(careerPointText.text!)! + Int(skillInitLabel.text!)!
        return sum
    }
    
    func careerPointPickerChanged() {
        let selectedOne = careerPointPicker.selectedRow(inComponent: 0)
        let selected = careerPointModelPicker?.careerPointModelData[selectedOne]
        
        i = 0
        
        careerPointText.text = selected?.careerPoint
        
        if selectedOne == 0{
            careerPointText.text = "0"
            tapSelect()
            usedPoints[i!] = 0
            arraySkill[i!][careerPointText.tag] = Int(careerPointText.text!)!
            sumArray(i!)
            NotificationCenter.default.post(name: .valueSelected, object: self)
        }
        if careerPointText.text == selected?.careerPoint {
            
            tapSelect()
            usedPoints[i!] = 0
            arraySkill[i!][careerPointText.tag] = Int(careerPointText.text!)!
            sumArray(i!)
            print(usedPoints[i!])
            NotificationCenter.default.post(name: .valueSelected, object: self)
            
        }
    }
    
    func normalPointPickerChanged() {
        let selectedOne = normalPointPicker.selectedRow(inComponent: 0)
        let selected = normalPointModelPicker?.normalPointModelData[selectedOne]
        
        i = 1
        print("selectedOne = \(selectedOne)")
        if selectedOne != 0 {
            normalPointText.text = selected?.normalPoint
        }else{
            normalPointText.text = "0"
            tapSelect()
            usedPoints[i!] = 0
            arraySkill[i!][normalPointText.tag] = Int(normalPointText.text!)!
            sumArray(i!)
            
            NotificationCenter.default.post(name: .valueSelected, object: self)
        }
        
        if normalPointText.text == selected?.normalPoint {
            
            tapSelect()
            usedPoints[i!] = 0
            arraySkill[i!][normalPointText.tag] = Int(normalPointText.text!)!
            sumArray(i!)
            NotificationCenter.default.post(name: .valueSelected, object: self)
            //print("normalPointText.tag = \(normalPointText.tag)")
        }
    }
    
    func notificationAddObserver(selector: Selector, name: Notification.Name) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    func setupView() {
        
        addSubview(skillNameLabel)
        addSubview(skillRemarkLabel)
        addSubview(skillInitLabel)
        addSubview(careerPointText)
        addSubview(normalPointText)
        addSubview(totalPointsLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0][v5]-20-[v1(30)]-15-[v2(30)]-15-[v3(30)]-15-[v4(30)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": skillNameLabel, "v1": skillInitLabel, "v2": careerPointText, "v3": normalPointText,"v4": totalPointsLabel, "v5": skillRemarkLabel]))
        
        addConstraintV(skillNameLabel)
        addConstraintV(skillRemarkLabel)
        addConstraintV(skillInitLabel)
        addConstraintV(careerPointText)
        addConstraintV(normalPointText)
        addConstraintV(totalPointsLabel)
        
        notificationAddObserver(selector: #selector(careerPointPickerChanged), name: .careerPointPickerChanged)
        notificationAddObserver(selector: #selector(normalPointPickerChanged), name: .normalPointPickerChanged)
        notificationAddObserver(selector: #selector(tapSelect), name: .tapFunc)
        
    }
    
    override func addConstraintV(_ labelName: UIView) {
        super.addConstraintV(labelName)
    }
    
    func sumArray(_ i:Int){
        for j in 0..<84{
            let value = arraySkill[i][j]
            usedPoints[i] += value
        }
        print("i = \(i)")
    }
}






