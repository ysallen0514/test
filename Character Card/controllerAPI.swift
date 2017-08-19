//
//  alertView.swift
//  Character Card
//
//  Created by user on 2017/8/9.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func descripAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let subView1:UIView =  alert.view.subviews[0]
        let subView2 = subView1.subviews[0]
        let subView3 = subView2.subviews[0]
        let subView4 = subView3.subviews[0]
        let subView5 = subView4.subviews[0]
        let title:UILabel = subView5.subviews[0] as! UILabel
        let message:UILabel = subView5.subviews[1] as! UILabel
        message.textAlignment = .left
        title.textAlignment = .center
        
        let cancelAction = UIAlertAction(title: "了解", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func gotostatusVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "statsViewController")
        navigationController?.show(vc, sender: self)
    }
    
    func wrongAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "了解", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert() {
        addAlertYorN(title: "", msg: "是否要取消創造角色？")
    }
    
    func addAlertWarning(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alert.addAction(checkAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func addAlertYorN(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "是", style: .default){ action in self.backPlayer()}
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "否", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func backPlayer(){
        tempCard = []
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "playerVC")
        navigationController?.show(vc, sender: self)
    }
    
    
    func back() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    func backHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homePageVC")
        navigationController?.show(vc, sender: self)
        
    }
    
    func loginOut() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginVC")
        navigationController?.show(vc, sender: self)
    }
    
    func createButton() -> UIButton {
        let button: UIButton = UIButton.init(type: .custom)
        
        button.setImage(UIImage(named: "01home.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(backHome), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 30)
        return button
    }
    
    func createTextButton(title:String) -> UIButton {
        let button: UIButton = UIButton.init(type: .custom)
        
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(loginOut), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 30)
        return button
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyBoard() {
        self.view.endEditing(true)
    }
}
