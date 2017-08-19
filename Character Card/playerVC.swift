//
//  playerVC.swift
//  Character Card
//
//  Created by user on 2017/7/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class playerVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        myCell.cardNameLabel.text = cardsName[indexPath.row]
        myCell.ageLabel.text = "年齡：\(cardsAge[indexPath.row])"
        myCell.timeAgeLabel.text = "年代：\(cardsTimeAge[indexPath.row])"
        myCell.myTableVC = self
        return myCell
    }
    
    override func insert(cardname: String, cardAge: String, cardTimeAge: String) {
        super.insert(cardname: cardname, cardAge: cardAge, cardTimeAge: cardTimeAge)
    }
    
    func deleteCell(_ cell: UITableViewCell) {
        
        if let deletionIndexPath = tableView.indexPath(for: cell){
            cardsName.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
    
    func addAlertYorN(title:String, msg:String, cell: UITableViewCell) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "是", style: .default){ action in self.deleteCell(cell)}
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "否", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func prePage(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homePageVC")
        navigationController?.show(vc, sender: self)
    }
}

class MyCell: UITableViewCell {
    
    var myTableVC = playerVC()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let cardNameLabel:UILabel = {
        let label = UILabel().createLabel(size: 20)
        return label
    }()
    
    let ageLabel:UILabel = {
        let label = UILabel().createLabel(size: 15)
        return label
    }()
    
    let timeAgeLabel:UILabel = {
        let label = UILabel().createLabel(size: 15)
        return label
    }()
    
    let actionBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("刪除", for: .normal)
        // button.tintColor = UIColor.gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        addSubview(cardNameLabel)
        addSubview(ageLabel)
        addSubview(timeAgeLabel)
        addSubview(actionBtn)
        actionBtn.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-18-[v1(65)]-18-[v2(95)]-20-[v3(50)]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cardNameLabel, "v1": ageLabel, "v2": timeAgeLabel, "v3": actionBtn]))
        addConstraintV(cardNameLabel)
        addConstraintV(ageLabel)
        addConstraintV(timeAgeLabel)
        addConstraintV(actionBtn)
    }
    
    func handleAction(){
        print("delete")
        myTableVC.addAlertYorN(title: "警告", msg: "是否要刪除這個角色？", cell: self)
    }
    
    
}


