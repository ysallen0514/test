//
//  cbVC.swift
//  Character Card
//
//  Created by falock1007 on 2017/8/11.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lableContent: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class CustomCell1: UITableViewCell {
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var content1: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class CustomCell2: UITableViewCell {
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var nowValue: UILabel!
    @IBOutlet weak var maxValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class CustomCell3: UITableViewCell {
    
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var bgText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


