//
//  TestTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 10/25/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TestTableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    var pizza: Pizza! {
        didSet {
            guard let pizza = pizza else { return }
                tableView.text = pizza.name
            }
    }
    
}
