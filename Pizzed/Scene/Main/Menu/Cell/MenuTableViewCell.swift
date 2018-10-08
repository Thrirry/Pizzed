//
//  MenuTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 9/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import ServicePlatform

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLableView: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MenuTableViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpLayout()
        setUpColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    var superStar: String? {
//        didSet {
//            guard let superStar = superStar else { return }
//            titleLableView.text = superStar
//        }
//    }
    func bind(_ viewModel: MenuViewModel.MenuData) {
            self.iconImageView.image = viewModel.0
            self.titleLableView.text = viewModel.1
    }
    
    func setUpLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints  = false
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.175).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        containerView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        titleLableView.translatesAutoresizingMaskIntoConstraints = false
        titleLableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        titleLableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        titleLableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 2).isActive = true
        titleLableView.textAlignment = .center
        titleLableView.contentMode = .scaleAspectFit
        let fontSizeRightBar = titleLableView.font.pointSize
        titleLableView.font = UIFont(name: "Charter-Bold", size: fontSizeRightBar)
    }
    
    func setUpColor(){
        containerView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        titleLableView.textColor = UIColor.FlatColor.Menu.green
    }
}
