//
//  roleInformationVC.swift
//  Character Card
//
//  Created by user on 2017/7/18.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class roleInformationVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var careerbtn: UIButton!
    @IBOutlet weak var careerText: UITextField!
    @IBOutlet weak var bornText: UITextField!
    @IBOutlet weak var liveText: UITextField!
    @IBOutlet weak var timeAgeText: UITextField!
    
    
    var careerselect:String? = "請按我"
    
    let toolBar = UIToolbar()
    
    var agePicker = UIPickerView()
    var ageModelPicker: AgeModelPicker?
    
    var genderPicker =  UIPickerView()
    var genderModelPicker: GenderModelPicker?
    
    var careerPicker =  UIPickerView()
    var careerModelPicker: CareerModelPicker?
    
    var timeAgePicker = UIPickerView()
    var timeAgeModelPicker: TimeAgeModelPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        nameText.text = appDelegate.page2[0]
        ageText.text = appDelegate.page2[1]
        genderText.text = appDelegate.page2[2]
        timeAgeText.text = appDelegate.page2[4]
        bornText.text = appDelegate.page2[5]
        liveText.text = appDelegate.page2[6]
        
        if careerselect != nil {
            careerbtn.setTitle(careerselect,for: .normal)
        }
        
        tapGesture()

        
        notificationAddObserver(selector: #selector(agePickerChanged), name: .agePickerChanged)
        notificationAddObserver(selector: #selector(genderPickerChanged), name: .genderPickerChanged)
        notificationAddObserver(selector: #selector(careerPickerChanged), name: .careerPickerChanged)
        notificationAddObserver(selector: #selector(timeAgePickerChanged), name: .timeAgePickerChanged)
        
        createAgePicker()
        createGenderPicker()
        createCareerPicker()
        createTimeAgePicker()
        
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }

    
    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        self.showAlert()
    }
    
    func getTempCard() {// -> String {
        tempCard.append(nameText.text!)
        tempCard.append(ageText.text!)
        tempCard.append(timeAgeText.text!)
        print(tempCard)
    }
    
    func createAgePicker() {
        
        ageModelPicker = AgeModelPicker()
        ageModelPicker?.ageModelData = setData.getAgeData()
        
        agePicker.delegate = ageModelPicker
        agePicker.dataSource = ageModelPicker
        
        ageText.inputView = agePicker
        
        agePicker.backgroundColor = UIColor.clear
        
        ageText.inputAccessoryView = toolBar
        // createToolBar()
    }
    
    func createGenderPicker() {
        
        genderModelPicker = GenderModelPicker()
        genderModelPicker?.genderModelData = setData.getGenderData()
        
        genderPicker.delegate = genderModelPicker
        genderPicker.dataSource = genderModelPicker
        
        genderText.inputView = genderPicker
        
        genderPicker.backgroundColor = UIColor.clear
        
        genderText.inputAccessoryView = toolBar
        // createToolBar()
    }
    
    func createCareerPicker() {
        
        careerModelPicker = CareerModelPicker()
        careerModelPicker?.careerModelData = setData.getCareerData()
        
        careerPicker.delegate = careerModelPicker
        careerPicker.dataSource = careerModelPicker
        
        careerText.inputView = careerPicker
        
        careerPicker.backgroundColor = UIColor.clear
        
        careerText.inputAccessoryView = toolBar
        // createToolBar()
    }
    
    func createTimeAgePicker() {
        
        timeAgeModelPicker = TimeAgeModelPicker()
        timeAgeModelPicker?.timeAgeModelData = setData.getTimeAgeData()
        
        timeAgePicker.delegate = timeAgeModelPicker
        timeAgePicker.dataSource = timeAgeModelPicker
        
        timeAgeText.inputView = timeAgePicker
        
        timeAgePicker.backgroundColor = UIColor.clear
        
        timeAgeText.inputAccessoryView = toolBar
        // createToolBar()
    }
    
    func createToolBar() {
        
        toolBar.sizeToFit()
        
        toolBar.barTintColor = UIColor.lightGray
        toolBar.tintColor = UIColor.white
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(roleInformationVC.dismissKeyboard))
        
        toolBar.setItems([doneBtn], animated: true)
        toolBar.isUserInteractionEnabled = true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func notificationAddObserver(selector: Selector, name: Notification.Name) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    func agePickerChanged() {
        let selectedOne = agePicker.selectedRow(inComponent: 0)
        let selected = ageModelPicker?.ageModelData[selectedOne]
        
        ageText.text = selected?.age
        if selected?.age == "請選擇你要的年齡" {
//            wrongAlert(title: "錯誤", msg: "請選擇一個數字")
            ageText.text = ""
        }
    }
    
    func genderPickerChanged() {
        let selectedOne = genderPicker.selectedRow(inComponent: 0)
        let selected = genderModelPicker?.genderModelData[selectedOne]
        
        genderText.text = selected?.gender
    }
    
    func careerPickerChanged() {
        let selectedOne = careerPicker.selectedRow(inComponent: 0)
        let selected = careerModelPicker?.careerModelData[selectedOne]
        
        careerText.text = selected?.career
    }
    
    func timeAgePickerChanged() {
        let selectedOne = timeAgePicker.selectedRow(inComponent: 0)
        let selected = timeAgeModelPicker?.timeAgeModelData[selectedOne]
        
        timeAgeText.text = selected?.timeAge
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        if nameText.text != "" {
            appDelegate.page2.remove(at: 0)
            appDelegate.page2.insert(nameText.text!,at:0)
        }
        
        if ageText.text != "" {
            appDelegate.page2.remove(at: 1)
            appDelegate.page2.insert(ageText.text!,at:1)
        }
        
        if genderText.text != "" {
            appDelegate.page2.remove(at: 2)
            appDelegate.page2.insert(genderText.text!,at:2)
        }
        
        if careerselect != "請按我" {
            appDelegate.page2.remove(at: 3)
            appDelegate.page2.insert(careerselect!,at:3)
        }
        
        if timeAgeText.text != "" {
            appDelegate.page2.remove(at: 4)
            appDelegate.page2.insert(timeAgeText.text!,at:4)
        }
        
        if bornText.text != "" {
            appDelegate.page2.remove(at: 5)
            appDelegate.page2.insert(bornText.text!,at:5)
        }
        
        if liveText.text != "" {
            appDelegate.page2.remove(at: 6)
            appDelegate.page2.insert(liveText.text!,at:6)
        }
        
        if segue.identifier == "gotostatus"{
            if nameText.text == "" {
                wrongAlert(title: "錯誤", msg: "請確認角色名稱是否填寫")
            }else if ageText.text == "" {
                wrongAlert(title: "錯誤", msg: "請確認年齡是否選擇")
            }else if genderText.text == "" {
                wrongAlert(title: "錯誤", msg: "請確認性別是否選擇")
            }else if careerselect == "請按我" {
                wrongAlert(title: "錯誤", msg: "請選擇角色職業")
            }else if timeAgeText.text == ""{
                wrongAlert(title: "錯誤", msg: "請選擇角色生存年代")
            }else{
                getTempCard()
            }
        }
    }
}

