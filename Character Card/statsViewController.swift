//
//  statsViewController.swift
//  Character Card
//
//  Created by user on 2017/8/9.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class statsViewController: UIViewController {
    
    @IBOutlet weak var UIBarbtn: UIButton!
    @IBAction func prePage(_ sender: Any) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        self.showAlert()
    }
    
    var sevenDICE:Array<String> = [] // 摋七次的那組
    var fiveDICE:Array<String> = [] // 摋五次那組
    var twoDICE:Array<String> = [] // 摋兩次那組
    
    //拖曳以及讀取數值
    
    var ani: UIDynamicAnimator!
    
    @IBOutlet weak var DICEstr: UILabel!
    @IBOutlet weak var DICEcon: UILabel!
    @IBOutlet weak var DICEdex: UILabel!
    @IBOutlet weak var DICEapp: UILabel!
    @IBOutlet weak var DICEpow: UILabel!
    @IBOutlet weak var DICEint: UILabel!
    @IBOutlet weak var DICEsize: UILabel!
    @IBOutlet weak var DICEedu: UILabel!
    @IBOutlet weak var DICEluck: UILabel!
    
    @IBOutlet weak var D01: UILabel!
    @IBOutlet weak var D02: UILabel!
    @IBOutlet weak var D03: UILabel!
    @IBOutlet weak var D04: UILabel!
    @IBOutlet weak var D05: UILabel!
    @IBOutlet weak var D06: UILabel!
    @IBOutlet weak var D07: UILabel!
    @IBOutlet weak var D08: UILabel!
    @IBOutlet weak var D09: UILabel!
    @IBOutlet weak var D10: UILabel!
    @IBOutlet weak var D11: UILabel!
    @IBOutlet weak var D12: UILabel!
    @IBOutlet weak var D13: UILabel!
    @IBOutlet weak var D14: UILabel!
    
    @IBOutlet var Pan01switch: UIPanGestureRecognizer!
    @IBOutlet var Pan02switch: UIPanGestureRecognizer!
    @IBOutlet var Pan03switch: UIPanGestureRecognizer!
    @IBOutlet var Pan04switch: UIPanGestureRecognizer!
    @IBOutlet var Pan05switch: UIPanGestureRecognizer!
    @IBOutlet var Pan06switch: UIPanGestureRecognizer!
    @IBOutlet var Pan07switch: UIPanGestureRecognizer!
    @IBOutlet var Pan08switch: UIPanGestureRecognizer!
    @IBOutlet var Pan09switch: UIPanGestureRecognizer!
    @IBOutlet var Pan10switch: UIPanGestureRecognizer!
    @IBOutlet var Pan11switch: UIPanGestureRecognizer!
    @IBOutlet var Pan12switch: UIPanGestureRecognizer!
    @IBOutlet var Pan13switch: UIPanGestureRecognizer!
    @IBOutlet var Pan14switch: UIPanGestureRecognizer!
    
    var D01cgp:CGPoint?
    var D02cgp:CGPoint?
    var D03cgp:CGPoint?
    var D04cgp:CGPoint?
    var D05cgp:CGPoint?
    var D06cgp:CGPoint?
    var D07cgp:CGPoint?
    var D08cgp:CGPoint?
    var D09cgp:CGPoint?
    var D10cgp:CGPoint?
    var D11cgp:CGPoint?
    var D12cgp:CGPoint?
    var D13cgp:CGPoint?
    var D14cgp:CGPoint?
    
    
    
    
    
    @IBAction func Pan01(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        var point = sender.location(in: view)
        //  移動物件
        D01.center = point
        self.view.bringSubview(toFront: D01)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D01.center = DICEstr.center
                DICEstr.text = D01.text
                self.view.sendSubview(toBack: D01)
                Pan01switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D01.center = DICEcon.center
                DICEcon.text = D01.text
                self.view.sendSubview(toBack: D01)
                Pan01switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D01.center = DICEdex.center
                DICEdex.text = D01.text
                Pan01switch.isEnabled = false
                self.view.sendSubview(toBack: D01)
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D01.center = DICEapp.center
                DICEapp.text = D01.text
                self.view.sendSubview(toBack: D01)
                Pan01switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D01.center = DICEpow.center
                DICEpow.text = D01.text
                self.view.sendSubview(toBack: D01)
                Pan01switch.isEnabled = false
            }else{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
            
        }
        
        if sender.state == .ended{
            if D01.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D01.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D01.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D01.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D01.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
            if D01.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap01(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D01cgp
        let snap = UISnapBehavior(item: D01, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan01switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    
    
    
    @IBAction func Pan02(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D02.center = point
        self.view.bringSubview(toFront: D02)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D02.center = DICEstr.center
                DICEstr.text = D02.text
                self.view.sendSubview(toBack: D02)
                Pan02switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D02.center = DICEcon.center
                DICEcon.text = D02.text
                self.view.sendSubview(toBack: D02)
                Pan02switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D02.center = DICEdex.center
                DICEdex.text = D02.text
                self.view.sendSubview(toBack: D02)
                Pan02switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D02.center = DICEapp.center
                DICEapp.text = D02.text
                self.view.sendSubview(toBack: D02)
                Pan02switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D02.center = DICEpow.center
                DICEpow.text = D02.text
                self.view.sendSubview(toBack: D02)
                Pan02switch.isEnabled = false
            }else{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D02.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D02.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D02.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D02.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D02.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
            if D02.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap02(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D02cgp
        let snap = UISnapBehavior(item: D02, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan02switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    
    
    
    @IBAction func Pan03(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D03.center = point
        self.view.bringSubview(toFront: D03)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D03.center = DICEstr.center
                DICEstr.text = D03.text
                self.view.sendSubview(toBack: D03)
                Pan03switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D03.center = DICEcon.center
                DICEcon.text = D03.text
                self.view.sendSubview(toBack: D03)
                Pan03switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D03.center = DICEdex.center
                DICEdex.text = D03.text
                self.view.sendSubview(toBack: D03)
                Pan03switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D03.center = DICEapp.center
                DICEapp.text = D03.text
                self.view.sendSubview(toBack: D03)
                Pan03switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D03.center = DICEpow.center
                DICEpow.text = D03.text
                self.view.sendSubview(toBack: D03)
                Pan03switch.isEnabled = false
            }else{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D03.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D03.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D03.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D03.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D03.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
            if D03.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap03(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D03cgp
        let snap = UISnapBehavior(item: D03, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan03switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    
    
    
    @IBAction func Pan04(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D04.center = point
        self.view.bringSubview(toFront: D04)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D04.center = DICEstr.center
                DICEstr.text = D04.text
                self.view.sendSubview(toBack: D04)
                Pan04switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D04.center = DICEcon.center
                DICEcon.text = D04.text
                self.view.sendSubview(toBack: D04)
                Pan04switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D04.center = DICEdex.center
                DICEdex.text = D04.text
                self.view.sendSubview(toBack: D04)
                Pan04switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D04.center = DICEapp.center
                DICEapp.text = D04.text
                self.view.sendSubview(toBack: D04)
                Pan04switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D04.center = DICEpow.center
                DICEpow.text = D04.text
                self.view.sendSubview(toBack: D04)
                Pan04switch.isEnabled = false
            }else{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D04.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D04.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D04.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D04.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D04.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
            if D04.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap04(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D04cgp
        let snap = UISnapBehavior(item: D04, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan04switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    
    
    
    @IBAction func Pan05(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D05.center = point
        self.view.bringSubview(toFront: D05)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D05.center = DICEstr.center
                DICEstr.text = D05.text
                self.view.sendSubview(toBack: D05)
                Pan05switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D05.center = DICEcon.center
                DICEcon.text = D05.text
                self.view.sendSubview(toBack: D05)
                Pan05switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D05.center = DICEdex.center
                DICEdex.text = D05.text
                self.view.sendSubview(toBack: D05)
                Pan05switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D05.center = DICEapp.center
                DICEapp.text = D05.text
                self.view.sendSubview(toBack: D05)
                Pan05switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D05.center = DICEpow.center
                DICEpow.text = D05.text
                self.view.sendSubview(toBack: D05)
                Pan05switch.isEnabled = false
            }else{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D05.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D05.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D05.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D05.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D05.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
            if D05.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap05(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D05cgp
        let snap = UISnapBehavior(item: D05, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan05switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    @IBAction func Pan06(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D06.center = point
        self.view.bringSubview(toFront: D06)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D06.center = DICEstr.center
                DICEstr.text = D06.text
                self.view.sendSubview(toBack: D06)
                Pan06switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D06.center = DICEcon.center
                DICEcon.text = D06.text
                self.view.sendSubview(toBack: D06)
                Pan06switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D06.center = DICEdex.center
                DICEdex.text = D06.text
                self.view.sendSubview(toBack: D06)
                Pan06switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D06.center = DICEapp.center
                DICEapp.text = D06.text
                self.view.sendSubview(toBack: D06)
                Pan06switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D06.center = DICEpow.center
                DICEpow.text = D06.text
                self.view.sendSubview(toBack: D06)
                Pan06switch.isEnabled = false
            }else{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D06.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D06.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D06.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D06.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D06.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D06.center == D07.center{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan07switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap06(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D06cgp
        let snap = UISnapBehavior(item: D06, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan06switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    
    
    
    @IBAction func Pan07(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D07.center = point
        self.view.bringSubview(toFront: D07)
        
        if sender.state == .ended{
            if point.x > DICEstr.center.x - 30 && point.x < DICEstr.center.x + 30 && point.y > DICEstr.center.y - 30 && point.y < DICEstr.center.y + 30 {
                D07.center = DICEstr.center
                DICEstr.text = D07.text
                self.view.sendSubview(toBack: D07)
                Pan07switch.isEnabled = false
            }else if point.x > DICEcon.center.x - 30 && point.x < DICEcon.center.x + 30 && point.y > DICEcon.center.y - 30 && point.y < DICEcon.center.y + 30 {
                D07.center = DICEcon.center
                DICEcon.text = D07.text
                self.view.sendSubview(toBack: D07)
                Pan07switch.isEnabled = false
            }else if point.x > DICEdex.center.x - 30 && point.x < DICEdex.center.x + 30 && point.y > DICEdex.center.y - 30 && point.y < DICEdex.center.y + 30 {
                D07.center = DICEdex.center
                DICEdex.text = D07.text
                self.view.sendSubview(toBack: D07)
                Pan07switch.isEnabled = false
            }else if point.x > DICEapp.center.x - 30 && point.x < DICEapp.center.x + 30 && point.y > DICEapp.center.y - 30 && point.y < DICEapp.center.y + 30 {
                D07.center = DICEapp.center
                DICEapp.text = D07.text
                self.view.sendSubview(toBack: D07)
                Pan07switch.isEnabled = false
            }else if point.x > DICEpow.center.x - 30 && point.x < DICEpow.center.x + 30 && point.y > DICEpow.center.y - 30 && point.y < DICEpow.center.y + 30 {
                D07.center = DICEpow.center
                DICEpow.text = D07.text
                self.view.sendSubview(toBack: D07)
                Pan07switch.isEnabled = false
            }else{
                let point = D07cgp
                let snap = UISnapBehavior(item: D07, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D07.center == D01.center{
                let point = D01cgp
                let snap = UISnapBehavior(item: D01, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan01switch.isEnabled = true
            }
            if D07.center == D02.center{
                let point = D02cgp
                let snap = UISnapBehavior(item: D02, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan02switch.isEnabled = true
            }
            if D07.center == D03.center{
                let point = D03cgp
                let snap = UISnapBehavior(item: D03, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan03switch.isEnabled = true
            }
            if D07.center == D04.center{
                let point = D04cgp
                let snap = UISnapBehavior(item: D04, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan04switch.isEnabled = true
            }
            if D07.center == D05.center{
                let point = D05cgp
                let snap = UISnapBehavior(item: D05, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan05switch.isEnabled = true
            }
            if D07.center == D06.center{
                let point = D06cgp
                let snap = UISnapBehavior(item: D06, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan06switch.isEnabled = true
            }
        }
    }
    
    @IBAction func Tap07(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D07cgp
        let snap = UISnapBehavior(item: D07, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan07switch.isEnabled = true
        
        if click.x > DICEstr.center.x - 30 && click.x < DICEstr.center.x + 30 && click.y > DICEstr.center.y - 30 && click.y < DICEstr.center.y + 30{
            DICEstr.text = "力量"
        }else if click.x > DICEcon.center.x - 30 && click.x < DICEcon.center.x + 30 && click.y > DICEcon.center.y - 30 && click.y < DICEcon.center.y + 30{
            DICEcon.text = "體質"
        }else if click.x > DICEdex.center.x - 30 && click.x < DICEdex.center.x + 30 && click.y > DICEdex.center.y - 30 && click.y < DICEdex.center.y + 30{
            DICEdex.text = "敏捷"
        }else if click.x > DICEapp.center.x - 30 && click.x < DICEapp.center.x + 30 && click.y > DICEapp.center.y - 30 && click.y < DICEapp.center.y + 30{
            DICEapp.text = "外貌"
        }else if click.x > DICEpow.center.x - 30 && click.x < DICEpow.center.x + 30 && click.y > DICEpow.center.y - 30 && click.y < DICEpow.center.y + 30{
            DICEpow.text = "意志"
        }
    }
    
    @IBAction func Pan08(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D08.center = point
        self.view.bringSubview(toFront: D08)
        
        if sender.state == .ended{
            if point.x > DICEint.center.x - 30 && point.x < DICEint.center.x + 30 && point.y > DICEint.center.y - 30 && point.y < DICEint.center.y + 30 {
                D08.center = DICEint.center
                DICEint.text = D08.text
                self.view.sendSubview(toBack: D08)
                Pan08switch.isEnabled = false
            }else if point.x > DICEsize.center.x - 30 && point.x < DICEsize.center.x + 30 && point.y > DICEsize.center.y - 30 && point.y < DICEsize.center.y + 30 {
                D08.center = DICEsize.center
                DICEsize.text = D08.text
                self.view.sendSubview(toBack: D08)
                Pan08switch.isEnabled = false
            }else if point.x > DICEedu.center.x - 30 && point.x < DICEedu.center.x + 30 && point.y > DICEedu.center.y - 30 && point.y < DICEedu.center.y + 30 {
                D08.center = DICEedu.center
                DICEedu.text = D08.text
                self.view.sendSubview(toBack: D08)
                Pan08switch.isEnabled = false
            }else{
                let point = D08cgp
                let snap = UISnapBehavior(item: D08, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D08.center == D09.center{
                let point = D09cgp
                let snap = UISnapBehavior(item: D09, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan09switch.isEnabled = true
            }
            if D08.center == D10.center{
                let point = D10cgp
                let snap = UISnapBehavior(item: D10, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan10switch.isEnabled = true
            }
            if D08.center == D11.center{
                let point = D11cgp
                let snap = UISnapBehavior(item: D11, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan11switch.isEnabled = true
            }
            if D08.center == D12.center{
                let point = D12cgp
                let snap = UISnapBehavior(item: D12, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan12switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap08(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D08cgp
        let snap = UISnapBehavior(item: D08, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan08switch.isEnabled = true
        
        if click.x > DICEint.center.x - 30 && click.x < DICEint.center.x + 30 && click.y > DICEint.center.y - 30 && click.y < DICEint.center.y + 30{
            DICEint.text = "智力"
        }else if click.x > DICEsize.center.x - 30 && click.x < DICEsize.center.x + 30 && click.y > DICEsize.center.y - 30 && click.y < DICEsize.center.y + 30{
            DICEsize.text = "體型"
        }else if click.x > DICEedu.center.x - 30 && click.x < DICEedu.center.x + 30 && click.y > DICEedu.center.y - 30 && click.y < DICEedu.center.y + 30{
            DICEedu.text = "教育"
        }
    }
    
    @IBAction func Pan09(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D09.center = point
        self.view.bringSubview(toFront: D09)
        
        if sender.state == .ended{
            if point.x > DICEint.center.x - 30 && point.x < DICEint.center.x + 30 && point.y > DICEint.center.y - 30 && point.y < DICEint.center.y + 30 {
                D09.center = DICEint.center
                DICEint.text = D09.text
                self.view.sendSubview(toBack: D09)
                Pan09switch.isEnabled = false
            }else if point.x > DICEsize.center.x - 30 && point.x < DICEsize.center.x + 30 && point.y > DICEsize.center.y - 30 && point.y < DICEsize.center.y + 30 {
                D09.center = DICEsize.center
                DICEsize.text = D09.text
                self.view.sendSubview(toBack: D09)
                Pan09switch.isEnabled = false
            }else if point.x > DICEedu.center.x - 30 && point.x < DICEedu.center.x + 30 && point.y > DICEedu.center.y - 30 && point.y < DICEedu.center.y + 30 {
                D09.center = DICEedu.center
                DICEedu.text = D09.text
                self.view.sendSubview(toBack: D09)
                Pan09switch.isEnabled = false
            }else{
                let point = D09cgp
                let snap = UISnapBehavior(item: D09, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D09.center == D08.center{
                let point = D08cgp
                let snap = UISnapBehavior(item: D08, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan08switch.isEnabled = true
            }
            if D09.center == D10.center{
                let point = D10cgp
                let snap = UISnapBehavior(item: D10, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan10switch.isEnabled = true
            }
            if D09.center == D11.center{
                let point = D11cgp
                let snap = UISnapBehavior(item: D11, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan11switch.isEnabled = true
            }
            if D09.center == D12.center{
                let point = D12cgp
                let snap = UISnapBehavior(item: D12, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan12switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap09(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D09cgp
        let snap = UISnapBehavior(item: D09, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan09switch.isEnabled = true
        
        if click.x > DICEint.center.x - 30 && click.x < DICEint.center.x + 30 && click.y > DICEint.center.y - 30 && click.y < DICEint.center.y + 30{
            DICEint.text = "智力"
        }else if click.x > DICEsize.center.x - 30 && click.x < DICEsize.center.x + 30 && click.y > DICEsize.center.y - 30 && click.y < DICEsize.center.y + 30{
            DICEsize.text = "體型"
        }else if click.x > DICEedu.center.x - 30 && click.x < DICEedu.center.x + 30 && click.y > DICEedu.center.y - 30 && click.y < DICEedu.center.y + 30{
            DICEedu.text = "教育"
        }
    }
    
    @IBAction func Pan10(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D10.center = point
        self.view.bringSubview(toFront: D10)
        
        if sender.state == .ended{
            if point.x > DICEint.center.x - 30 && point.x < DICEint.center.x + 30 && point.y > DICEint.center.y - 30 && point.y < DICEint.center.y + 30 {
                D10.center = DICEint.center
                DICEint.text = D10.text
                self.view.sendSubview(toBack: D10)
                Pan10switch.isEnabled = false
            }else if point.x > DICEsize.center.x - 30 && point.x < DICEsize.center.x + 30 && point.y > DICEsize.center.y - 30 && point.y < DICEsize.center.y + 30 {
                D10.center = DICEsize.center
                DICEsize.text = D10.text
                self.view.sendSubview(toBack: D10)
                Pan10switch.isEnabled = false
            }else if point.x > DICEedu.center.x - 30 && point.x < DICEedu.center.x + 30 && point.y > DICEedu.center.y - 30 && point.y < DICEedu.center.y + 30 {
                D10.center = DICEedu.center
                DICEedu.text = D10.text
                self.view.sendSubview(toBack: D10)
                Pan10switch.isEnabled = false
            }else{
                let point = D10cgp
                let snap = UISnapBehavior(item: D10, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D10.center == D08.center{
                let point = D08cgp
                let snap = UISnapBehavior(item: D08, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan08switch.isEnabled = true
            }
            if D10.center == D09.center{
                let point = D09cgp
                let snap = UISnapBehavior(item: D09, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan09switch.isEnabled = true
            }
            if D10.center == D11.center{
                let point = D11cgp
                let snap = UISnapBehavior(item: D11, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan11switch.isEnabled = true
            }
            if D10.center == D12.center{
                let point = D12cgp
                let snap = UISnapBehavior(item: D12, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan12switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap10(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D10cgp
        let snap = UISnapBehavior(item: D10, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan10switch.isEnabled = true
        
        if click.x > DICEint.center.x - 30 && click.x < DICEint.center.x + 30 && click.y > DICEint.center.y - 30 && click.y < DICEint.center.y + 30{
            DICEint.text = "智力"
        }else if click.x > DICEsize.center.x - 30 && click.x < DICEsize.center.x + 30 && click.y > DICEsize.center.y - 30 && click.y < DICEsize.center.y + 30{
            DICEsize.text = "體型"
        }else if click.x > DICEedu.center.x - 30 && click.x < DICEedu.center.x + 30 && click.y > DICEedu.center.y - 30 && click.y < DICEedu.center.y + 30{
            DICEedu.text = "教育"
        }
    }
    
    @IBAction func Pan11(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D11.center = point
        self.view.bringSubview(toFront: D11)
        
        if sender.state == .ended{
            if point.x > DICEint.center.x - 30 && point.x < DICEint.center.x + 30 && point.y > DICEint.center.y - 30 && point.y < DICEint.center.y + 30 {
                D11.center = DICEint.center
                DICEint.text = D11.text
                self.view.sendSubview(toBack: D11)
                Pan11switch.isEnabled = false
            }else if point.x > DICEsize.center.x - 30 && point.x < DICEsize.center.x + 30 && point.y > DICEsize.center.y - 30 && point.y < DICEsize.center.y + 30 {
                D11.center = DICEsize.center
                DICEsize.text = D11.text
                self.view.sendSubview(toBack: D11)
                Pan11switch.isEnabled = false
            }else if point.x > DICEedu.center.x - 30 && point.x < DICEedu.center.x + 30 && point.y > DICEedu.center.y - 30 && point.y < DICEedu.center.y + 30 {
                D11.center = DICEedu.center
                DICEedu.text = D11.text
                self.view.sendSubview(toBack: D11)
                Pan11switch.isEnabled = false
            }else{
                let point = D11cgp
                let snap = UISnapBehavior(item: D11, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D11.center == D08.center{
                let point = D08cgp
                let snap = UISnapBehavior(item: D08, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan08switch.isEnabled = true
            }
            if D11.center == D09.center{
                let point = D09cgp
                let snap = UISnapBehavior(item: D09, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan09switch.isEnabled = true
            }
            if D11.center == D10.center{
                let point = D10cgp
                let snap = UISnapBehavior(item: D10, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan10switch.isEnabled = true
            }
            if D11.center == D12.center{
                let point = D12cgp
                let snap = UISnapBehavior(item: D12, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan12switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap11(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D11cgp
        let snap = UISnapBehavior(item: D11, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan11switch.isEnabled = true
        
        if click.x > DICEint.center.x - 30 && click.x < DICEint.center.x + 30 && click.y > DICEint.center.y - 30 && click.y < DICEint.center.y + 30{
            DICEint.text = "智力"
        }else if click.x > DICEsize.center.x - 30 && click.x < DICEsize.center.x + 30 && click.y > DICEsize.center.y - 30 && click.y < DICEsize.center.y + 30{
            DICEsize.text = "體型"
        }else if click.x > DICEedu.center.x - 30 && click.x < DICEedu.center.x + 30 && click.y > DICEedu.center.y - 30 && click.y < DICEedu.center.y + 30{
            DICEedu.text = "教育"
        }
    }
    
    @IBAction func Pan12(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D12.center = point
        self.view.bringSubview(toFront: D12)
        
        if sender.state == .ended{
            if point.x > DICEint.center.x - 30 && point.x < DICEint.center.x + 30 && point.y > DICEint.center.y - 30 && point.y < DICEint.center.y + 30 {
                D12.center = DICEint.center
                DICEint.text = D12.text
                self.view.sendSubview(toBack: D12)
                Pan12switch.isEnabled = false
            }else if point.x > DICEsize.center.x - 30 && point.x < DICEsize.center.x + 30 && point.y > DICEsize.center.y - 30 && point.y < DICEsize.center.y + 30 {
                D12.center = DICEsize.center
                DICEsize.text = D12.text
                self.view.sendSubview(toBack: D12)
                Pan12switch.isEnabled = false
            }else if point.x > DICEedu.center.x - 30 && point.x < DICEedu.center.x + 30 && point.y > DICEedu.center.y - 30 && point.y < DICEedu.center.y + 30 {
                D12.center = DICEedu.center
                DICEedu.text = D12.text
                self.view.sendSubview(toBack: D12)
                Pan12switch.isEnabled = false
            }else{
                let point = D12cgp
                let snap = UISnapBehavior(item: D12, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D12.center == D08.center{
                let point = D08cgp
                let snap = UISnapBehavior(item: D08, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan08switch.isEnabled = true
            }
            if D12.center == D09.center{
                let point = D09cgp
                let snap = UISnapBehavior(item: D09, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan09switch.isEnabled = true
            }
            if D12.center == D10.center{
                let point = D10cgp
                let snap = UISnapBehavior(item: D10, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan10switch.isEnabled = true
            }
            if D12.center == D11.center{
                let point = D11cgp
                let snap = UISnapBehavior(item: D11, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan11switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap12(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D12cgp
        let snap = UISnapBehavior(item: D12, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan12switch.isEnabled = true
        
        if click.x > DICEint.center.x - 30 && click.x < DICEint.center.x + 30 && click.y > DICEint.center.y - 30 && click.y < DICEint.center.y + 30{
            DICEint.text = "智力"
        }else if click.x > DICEsize.center.x - 30 && click.x < DICEsize.center.x + 30 && click.y > DICEsize.center.y - 30 && click.y < DICEsize.center.y + 30{
            DICEsize.text = "體型"
        }else if click.x > DICEedu.center.x - 30 && click.x < DICEedu.center.x + 30 && click.y > DICEedu.center.y - 30 && click.y < DICEedu.center.y + 30{
            DICEedu.text = "教育"
        }
    }
    
    @IBAction func Pan13(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D13.center = point
        self.view.bringSubview(toFront: D13)
        
        if sender.state == .ended{
            if point.x > DICEluck.center.x - 30 && point.x < DICEluck.center.x + 30 && point.y > DICEluck.center.y - 30 && point.y < DICEluck.center.y + 30 {
                D13.center = DICEluck.center
                DICEluck.text = D13.text
                self.view.sendSubview(toBack: D13)
                Pan13switch.isEnabled = false
            }else{
                let point = D13cgp
                let snap = UISnapBehavior(item: D13, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D13.center == D14.center{
                let point = D14cgp
                let snap = UISnapBehavior(item: D14, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan14switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap13(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D13cgp
        let snap = UISnapBehavior(item: D13, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan13switch.isEnabled = true
        
        if click.x > DICEluck.center.x - 30 && click.x < DICEluck.center.x + 30 && click.y > DICEluck.center.y - 30 && click.y < DICEluck.center.y + 30{
            DICEluck.text = "幸運"
        }
    }
    
    @IBAction func Pan14(_ sender: UIPanGestureRecognizer){
        //  取得手指座標
        let point = sender.location(in: view)
        //  移動物件
        D14.center = point
        self.view.bringSubview(toFront: D14)
        
        if sender.state == .ended{
            if point.x > DICEluck.center.x - 30 && point.x < DICEluck.center.x + 30 && point.y > DICEluck.center.y - 30 && point.y < DICEluck.center.y + 30 {
                D14.center = DICEluck.center
                DICEluck.text = D14.text
                self.view.sendSubview(toBack: D14)
                Pan14switch.isEnabled = false
            }else{
                let point = D14cgp
                let snap = UISnapBehavior(item: D14, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
            }
        }
        
        if sender.state == .ended{
            if D14.center == D13.center{
                let point = D13cgp
                let snap = UISnapBehavior(item: D13, snapTo: point!)
                snap.damping = 0.5;
                ani.removeAllBehaviors()
                ani.addBehavior(snap)
                Pan13switch.isEnabled = true
            }
            
        }
    }
    
    @IBAction func Tap14(_ sender: UITapGestureRecognizer) {
        //  取得手指座標
        let click = sender.location(in: view)
        let point = D14cgp
        let snap = UISnapBehavior(item: D14, snapTo: point!)
        snap.damping = 0.5;
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
        Pan14switch.isEnabled = true
        
        if click.x > DICEluck.center.x - 30 && click.x < DICEluck.center.x + 30 && click.y > DICEluck.center.y - 30 && click.y < DICEluck.center.y + 30{
            DICEluck.text = "幸運"
        }
    
        
    
    }
        var fullSize :CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        fullSize = UIScreen.main.bounds.size
        
        UIBarbtn.layer.cornerRadius = 5
        UIBarbtn.layer.masksToBounds = true
        
        ani = UIDynamicAnimator(referenceView: view)
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        D01.layer.cornerRadius = 10
        D01.layer.masksToBounds = true
        D02.layer.cornerRadius = 10
        D02.layer.masksToBounds = true
        D03.layer.cornerRadius = 10
        D03.layer.masksToBounds = true
        D04.layer.cornerRadius = 10
        D04.layer.masksToBounds = true
        D05.layer.cornerRadius = 10
        D05.layer.masksToBounds = true
        D06.layer.cornerRadius = 10
        D06.layer.masksToBounds = true
        D07.layer.cornerRadius = 10
        D07.layer.masksToBounds = true
        D08.layer.cornerRadius = 10
        D08.layer.masksToBounds = true
        D09.layer.cornerRadius = 10
        D09.layer.masksToBounds = true
        D10.layer.cornerRadius = 10
        D10.layer.masksToBounds = true
        D11.layer.cornerRadius = 10
        D11.layer.masksToBounds = true
        D12.layer.cornerRadius = 10
        D12.layer.masksToBounds = true
        D13.layer.cornerRadius = 10
        D13.layer.masksToBounds = true
        D14.layer.cornerRadius = 10
        D14.layer.masksToBounds = true
        DICEstr.layer.cornerRadius = 10
        DICEstr.layer.masksToBounds = true
        DICEcon.layer.cornerRadius = 10
        DICEcon.layer.masksToBounds = true
        DICEdex.layer.cornerRadius = 10
        DICEdex.layer.masksToBounds = true
        DICEapp.layer.cornerRadius = 10
        DICEapp.layer.masksToBounds = true
        DICEpow.layer.cornerRadius = 10
        DICEpow.layer.masksToBounds = true
        DICEint.layer.cornerRadius = 10
        DICEint.layer.masksToBounds = true
        DICEsize.layer.cornerRadius = 10
        DICEsize.layer.masksToBounds = true
        DICEedu.layer.cornerRadius = 10
        DICEedu.layer.masksToBounds = true
        DICEluck.layer.cornerRadius = 10
        DICEluck.layer.masksToBounds = true
        
        D01.text = appDelegate.page1[0]
        D02.text = appDelegate.page1[1]
        D03.text = appDelegate.page1[2]
        D04.text = appDelegate.page1[3]
        D05.text = appDelegate.page1[4]
        D06.text = appDelegate.page1[5]
        D07.text = appDelegate.page1[6]
        D08.text = appDelegate.page1[7]
        D09.text = appDelegate.page1[8]
        D10.text = appDelegate.page1[9]
        D11.text = appDelegate.page1[10]
        D12.text = appDelegate.page1[11]
        D13.text = appDelegate.page1[12]
        D14.text = appDelegate.page1[13]
        
        DICEstr.text = "力量"
        DICEcon.text = "體質"
        DICEdex.text = "敏捷"
        DICEapp.text = "外貌"
        DICEpow.text = "意志"
        DICEint.text = "智力"
        DICEsize.text = "體型"
        DICEedu.text = "教育"
        DICEluck.text = "幸運"
        
        DICEstr.center = CGPoint(x: fullSize.width*0.1, y: fullSize.height*0.1)
        DICEstr.bounds.size = CGSize(width: 60 ,height: 60)
        DICEcon.center = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.1)
        DICEcon.bounds.size = CGSize(width: 60 ,height: 60)
        DICEdex.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.1)
        DICEdex.bounds.size = CGSize(width: 60 ,height: 60)
        DICEapp.center = CGPoint(x: fullSize.width*0.7, y: fullSize.height*0.1)
        DICEapp.bounds.size = CGSize(width: 60 ,height: 60)
        DICEpow.center = CGPoint(x: fullSize.width*0.9, y: fullSize.height*0.1)
        DICEpow.bounds.size = CGSize(width: 60 ,height: 60)
        
        D01.center = CGPoint(x: fullSize.width*0.07, y: fullSize.height*0.2)
        D01.bounds.size = CGSize(width: 40 ,height: 40)
        D02.center = CGPoint(x: fullSize.width*0.21, y: fullSize.height*0.2)
        D02.bounds.size = CGSize(width: 40 ,height: 40)
        D03.center = CGPoint(x: fullSize.width*0.35, y: fullSize.height*0.2)
        D03.bounds.size = CGSize(width: 40 ,height: 40)
        D04.center = CGPoint(x: fullSize.width*0.49, y: fullSize.height*0.2)
        D04.bounds.size = CGSize(width: 40 ,height: 40)
        D05.center = CGPoint(x: fullSize.width*0.63, y: fullSize.height*0.2)
        D05.bounds.size = CGSize(width: 40 ,height: 40)
        D06.center = CGPoint(x: fullSize.width*0.77, y: fullSize.height*0.2)
        D06.bounds.size = CGSize(width: 40 ,height: 40)
        D07.center = CGPoint(x: fullSize.width*0.91, y: fullSize.height*0.2)
        D07.bounds.size = CGSize(width: 40 ,height: 40)
        
        DICEint.center = CGPoint(x: fullSize.width*0.2, y: fullSize.height*0.35)
        DICEint.bounds.size = CGSize(width: 60 ,height: 60)
        DICEsize.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.35)
        DICEsize.bounds.size = CGSize(width: 60 ,height: 60)
        DICEedu.center = CGPoint(x: fullSize.width*0.8, y: fullSize.height*0.35)
        DICEedu.bounds.size = CGSize(width: 60 ,height: 60)
        
        D08.center = CGPoint(x: fullSize.width*0.1, y: fullSize.height*0.45)
        D08.bounds.size = CGSize(width: 40 ,height: 40)
        D09.center = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.45)
        D09.bounds.size = CGSize(width: 40 ,height: 40)
        D10.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.45)
        D10.bounds.size = CGSize(width: 40 ,height: 40)
        D11.center = CGPoint(x: fullSize.width*0.7, y: fullSize.height*0.45)
        D11.bounds.size = CGSize(width: 40 ,height: 40)
        D12.center = CGPoint(x: fullSize.width*0.9, y: fullSize.height*0.45)
        D12.bounds.size = CGSize(width: 40 ,height: 40)
        
        DICEluck.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.6)
        DICEluck.bounds.size = CGSize(width: 60 ,height: 60)
        
        D13.center = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.7)
        D13.bounds.size = CGSize(width: 40 ,height: 40)
        D14.center = CGPoint(x: fullSize.width*0.6, y: fullSize.height*0.7)
        D14.bounds.size = CGSize(width: 40 ,height: 40)

        D01cgp = CGPoint(x: fullSize.width*0.07, y: fullSize.height*0.2)
        D02cgp = CGPoint(x: fullSize.width*0.21, y: fullSize.height*0.2)
        D03cgp = CGPoint(x: fullSize.width*0.35, y: fullSize.height*0.2)
        D04cgp = CGPoint(x: fullSize.width*0.49, y: fullSize.height*0.2)
        D05cgp = CGPoint(x: fullSize.width*0.63, y: fullSize.height*0.2)
        D06cgp = CGPoint(x: fullSize.width*0.77, y: fullSize.height*0.2)
        D07cgp = CGPoint(x: fullSize.width*0.91, y: fullSize.height*0.2)
        D08cgp = CGPoint(x: fullSize.width*0.1, y: fullSize.height*0.45)
        D09cgp = CGPoint(x: fullSize.width*0.3, y: fullSize.height*0.45)
        D10cgp = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.45)
        D11cgp = CGPoint(x: fullSize.width*0.7, y: fullSize.height*0.45)
        D12cgp = CGPoint(x: fullSize.width*0.9, y: fullSize.height*0.45)
        D13cgp = CGPoint(x: fullSize.width*0.4, y: fullSize.height*0.7)
        D14cgp = CGPoint(x: fullSize.width*0.6, y: fullSize.height*0.7)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoadjust"{
            let application = UIApplication.shared
            let appDelegate = application.delegate as! AppDelegate
            if DICEstr.text == "力量" || DICEcon.text == "體質" || DICEdex.text == "敏捷" || DICEapp.text == "外貌" || DICEpow.text == "意志" || DICEint.text == "智力" || DICEsize.text == "體型" || DICEedu.text == "教育" || DICEluck.text == "幸運" {
                wrongAlert(title: "錯誤", msg: "有些能力值沒有拖曳到喔\n請檢查一下")
            }else{
                if DICEstr.text == "18" && DICEsize.text == "8" {
                    DICEstr.text = "17"
                    DICEsize.text = "9"
                }else if DICEstr.text == "3" && DICEsize.text == "18" {
                    DICEstr.text = "4"
                    DICEsize.text = "17"
                }
                appDelegate.page3 = [DICEstr.text!,DICEcon.text!,DICEdex.text!,DICEapp.text!,DICEpow.text!,DICEint.text!,DICEsize.text!,DICEedu.text!,DICEluck.text!]
            }
        }
    }
    
    
}







