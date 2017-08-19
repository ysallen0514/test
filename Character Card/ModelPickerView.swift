//
//  ModelPickerView.swift
//  Character Card
//
//  Created by user on 2017/7/19.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class AgeModelPicker: UIPickerView {
    var ageModelData: [ageModel]!
}

class GenderModelPicker: UIPickerView {
    var genderModelData: [genderModel]!
}

class CareerModelPicker: UIPickerView {
    var careerModelData: [careerModel]!
}

class TimeAgeModelPicker: UIPickerView {
    var timeAgeModelData: [timeAgeModel]!
}

class CareerPointModelPicker: UIPickerView {
    var careerPointModelData: [careerPointModel]!
}

class NormalPointModelPicker: UIPickerView {
    var normalPointModelData: [normalPointModel]!
}

class CreditLevelModelPicker: UIPickerView {
    var creditLevelModelData: [creditLevelModel]!
}
extension AgeModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageModelData.count
    }
}

extension GenderModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderModelData.count
    }
}

extension CareerModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return careerModelData.count
    }
}

extension TimeAgeModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeAgeModelData.count
    }
}

extension CareerPointModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return careerPointModelData.count
    }
}

extension NormalPointModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return normalPointModelData.count
    }
}

extension CreditLevelModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return creditLevelModelData.count
    }
}


// pickerviewdelegatestart
extension AgeModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageModelData[row].age
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .agePickerChanged, object: self)
    }
}

extension GenderModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderModelData[row].gender
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        }else{
            label = UILabel()
        }
        
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 25)
        label.text = genderModelData[row].gender
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .genderPickerChanged, object: self)
    }
}

extension CareerModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return careerModelData[row].career
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .careerPickerChanged, object: self)
    }
}

extension TimeAgeModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return timeAgeModelData[row].timeAge
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .timeAgePickerChanged, object: self)
    }
}

extension CareerPointModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //let careerPoint = String(careerPointModelData[row].careerPoint)
        return careerPointModelData[row].careerPoint
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //setNeedsDisplay()
        //NotificationCenter.default.post(name: .tapFunc, object: self)
        NotificationCenter.default.post(name: .careerPointPickerChanged, object: self)
        
    }
}

extension NormalPointModelPicker: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(normalPointModelData[row].normalPoint)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .normalPointPickerChanged, object: self)
    }
}

extension CreditLevelModelPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(creditLevelModelData[row].creditLevel)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .creditLevelPickerChanged, object: self)
    }
}

// end
