//
//  careerdescriptionVC.swift
//  Character Card
//
//  Created by falock1007 on 2017/8/9.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class careerdescriptionVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
        
    @IBOutlet weak var pickerOcc: UIPickerView!
    @IBOutlet weak var textOcc: UITextView!
    
    var occupation = [String]()
    var descri = [String]()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return occupation.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return occupation[row]
    }
    
    var career:String? = ""
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textOcc.text = descri[row]
        career = occupation[row]
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        appDelegate.careerNumber = row - 1
    }
    
    @IBOutlet weak var UIBarbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        UIBarbtn.layer.cornerRadius = 5
        UIBarbtn.layer.masksToBounds = true
        
        career = "請選擇一個職業"
        
        textOcc.layer.cornerRadius = 10
        textOcc.layer.masksToBounds = true

        
        occupation.append("請選擇一個職業")
        let url = Bundle.main.url(forResource: "occupation", withExtension:"json")
        if let data = try? Data(contentsOf: url!){
            if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                
                descri.append("")
                for p in jsonObj as! [[String: AnyObject]]{
                    occupation.append("\(p["職業"] as! String)")
                    descri.append("\(p["描述"] as! String)")
                }
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtorole" {
            
            if career == "請選擇一個職業"{
                wrongAlert(title: "錯誤", msg: "您尚未選擇一個職業")
            }
            
            if let vc = segue.destination as? roleInformationVC {
                vc.careerselect = career
            }
        }
    }
}
