//
//  RighBarTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class RightBarTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "RightBarTableViewCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUIs()
        setupColor()
        self.titleLabel.formatTextLabelRightBar(named: titleLabel, title: "Label")
    }
    func displayContent(image: String, title: String) {
//        guard let url = URL(string: image) else {
//            return
//        }
        titleLabel.text = title
    }
    
    func bind(_ viewModel: HomeViewModel.RightBarData) {
        self.iconImageView.image = viewModel.0
        self.titleLabel.formatTextLabelRightBar(named: titleLabel, title: "Label")
    }
    
    func setupUIs() {
        mainContainView.translatesAutoresizingMaskIntoConstraints = false
        mainContainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainContainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainContainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainContainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        mainContainView.addSubview(iconView)
        setupIconView()
        mainContainView.addSubview(titleView)
        setupTitleView()
        
        mainContainView.layer.borderWidth = 0.2
    }
    
    func setupIconView(){
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.topAnchor.constraint(equalTo: mainContainView.topAnchor).isActive = true
        iconView.leftAnchor.constraint(equalTo: mainContainView.leftAnchor).isActive = true
        iconView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 0.5).isActive = true
        iconView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 1).isActive = true
        
        iconView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.9).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.9).isActive = true
        iconImageView.contentMode = .scaleAspectFit
    }
    
    func setupTitleView(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: iconView.bottomAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: mainContainView.leftAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 0.4).isActive = true
        titleView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 1).isActive = true
        
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true
    }
    
    func setupColor() {
        mainContainView.backgroundColor = UIColor.FlatColor.mainBackground
        iconView.backgroundColor = UIColor.FlatColor.mainBackground
        titleView.backgroundColor = UIColor.FlatColor.mainBackground
    }
}
