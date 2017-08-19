//
//  pointHeaderViewController.swift
//  Character Card
//
//  Created by user on 2017/8/9.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class Points: UITableViewHeaderFooterView {
    
    var creditLevelPicker =  UIPickerView()
    var creditLevelModelPicker: CreditLevelModelPicker?
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let careerPointsLabel: UILabel = {
        let label = UILabel().createLabel(size: 17)
        label.textAlignment = NSTextAlignment.natural
        return label
    }()
    
    let normalPointsLabel: UILabel = {
        let label = UILabel().createLabel(size: 17)
        label.textAlignment = NSTextAlignment.natural
        return label
    }()
    
    let remarkLabel:UILabel = {
        let label = UILabel().createLabel(size: 15)
        //label.text = "備註：任選2"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let creditLabel: UILabel = {
        let label = UILabel().createLabel(size: 15)
        label.text = "信用評級："
        return label
    }()
    
    var creditLevelTextField: UITextField = {
        let textField = UITextField().createTextField(size: 15)
        textField.text = "0"
        return textField
    }()
    
    let initPointTitleLabel: UILabel = {
        let label = UILabel().createLabel(size: 13)
        return label
    }()
    
    let careerPointTitleLabel: UILabel = {
        let label = UILabel().createLabel(size: 13)
        return label
    }()
    
    let normalPointTitleLabel: UILabel = {
        let label = UILabel().createLabel(size: 13)
        return label
    }()
    
    let totalPointTitleLabel: UILabel = {
        let label = UILabel().createLabel(size: 13)
        return label
    }()
    
    func setupViews(){
        
        addSubview(careerPointsLabel)
        addSubview(normalPointsLabel)
        addSubview(remarkLabel)
        addSubview(creditLabel)
        addSubview(creditLevelTextField)
        addSubview(initPointTitleLabel)
        addSubview(careerPointTitleLabel)
        addSubview(normalPointTitleLabel)
        addSubview(totalPointTitleLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0][v1]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": careerPointsLabel,"v1":normalPointsLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(375)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": remarkLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0][v1(20)]-50-[v2(40)]-5-[v3(40)]-5-[v4(40)]-5-[v5(40)]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": creditLabel,"v1": creditLevelTextField, "v2": initPointTitleLabel, "v3": careerPointTitleLabel, "v4": normalPointTitleLabel, "v5": totalPointTitleLabel]))
        
        addConstraintV(careerPointsLabel, remarkLabel, creditLabel)
        addConstraintV(careerPointsLabel, remarkLabel, creditLevelTextField)
        addConstraintV(normalPointsLabel, remarkLabel, initPointTitleLabel)
        addConstraintV(normalPointsLabel, remarkLabel, careerPointTitleLabel)
        addConstraintV(normalPointsLabel, remarkLabel, normalPointTitleLabel)
        addConstraintV(normalPointsLabel, remarkLabel, totalPointTitleLabel)
        
        notificationAddObserver(selector: #selector(creditLevelPickerChanged), name: .creditLevelPickerChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(valueSelected), name: .valueSelected, object: nil)
        isUsed = test()
    }
    
    func addConstraintV(_ labelName1: UILabel,_ labelName2: UILabel,_ labelName3: UIView) {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-[v1]-10-[v2]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": labelName1,"v1":labelName2,"v2":labelName3]))
    }
    
    func changeData() {
        creditLevelModelPicker?.creditLevelModelData = setData.getCreditLevelData()
    }
    
    func tapSelect() {
        self.changeData()
    }
    
    func createCreditLevelPicker(){//_ selectedValue:Int,_ initValue:Int) {
        
        creditLevelModelPicker = CreditLevelModelPicker()
        creditLevelModelPicker?.creditLevelModelData = setData.getCreditLevelData()
        
        creditLevelPicker.dataSource = creditLevelModelPicker
        creditLevelPicker.delegate = creditLevelModelPicker
        
        creditLevelTextField.inputView = creditLevelPicker
        creditLevelPicker.backgroundColor = .clear
    }

    
    func creditLevelPickerChanged() {
        let selectedOne = creditLevelPicker.selectedRow(inComponent: 0)
        let selected = creditLevelModelPicker?.creditLevelModelData[selectedOne]
        i = 0
        isUsed = test()
        if selectedOne != 0 {
            let application = UIApplication.shared
            let appDelegate = application.delegate as! AppDelegate
            isUsed = test()
            creditLevelTextField.text = selected?.creditLevel
            appDelegate.credit = selected?.creditLevel
            
        }else{
            isUsed = test()
            creditLevelTextField.text = "\(creditLower)"
            tapSelect()
            valueSelected()
            print(isUsed)
        }
        
        if creditLevelTextField.text == selected?.creditLevel {
            
            tapSelect()
            valueSelected()
            print(isUsed)
        }
    }
    
    func notificationAddObserver(selector: Selector, name: Notification.Name) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    // 點數計算
    func valueSelected() {
        print("valueSelected")
        if i! == 0{
            careerPointsLabel.text = "剩餘職業點： \(infact(num: 300,i!))"
        }else if i! == 1 {
            normalPointsLabel.text = "剩餘興趣點： \(infact(num: 240,i!))"
        }
    }
    
    func infact(num:Int,_ i:Int) -> Int {
        let i = i
        let sum0 = num - usedPoints[i] - Int(creditLevelTextField.text!)!
        if i == 0 {
            print("使用職業點")
        }else if i == 1 {
            print("使用興趣點")
        }
        return sum0
    }
    // 如果有數值不對的
    
    func test() -> Bool {
        
        if Int(creditLevelTextField.text!)! < creditLower {
            isUsed = false
        }else if Int(creditLevelTextField.text!)! >= creditLower && Int(creditLevelTextField.text!)! <= creditUpper {
            isUsed = true
        }
        return isUsed
    }
    
    
    
}
