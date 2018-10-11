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
        
        if self.titleLableView.text == "Your Cart" {
            setupNotificationView()
        }
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
    
    let notificationView = UIView()
    let notificationLabel = UILabel()
    let cornerRadius: CGFloat = 13.0
    
    func setupNotificationView(){
        iconImageView.addSubview(notificationView)
        notificationView.addSubview(notificationLabel)
        
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor).isActive = true
        notificationLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
        notificationLabel.text = "1"
        notificationLabel.formatMenuTitleLabel(named: notificationLabel)
        
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        notificationView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        notificationView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        notificationView.leftAnchor.constraint(equalTo: iconImageView.leftAnchor, constant: 2).isActive = true
        notificationView.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 2).isActive = true
        notificationView.layer.cornerRadius = cornerRadius
    }
    
    func setUpLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints  = false
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        containerView.addSubview(iconImageView)
        
        /// Set icon image view
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        
        /// Set title label
        titleLableView.translatesAutoresizingMaskIntoConstraints = false
        titleLableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        titleLableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        titleLableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 2).isActive = true
        titleLableView.textAlignment = .center
        titleLableView.contentMode = .scaleAspectFit
        titleLableView.formatMenuTitleLabel(named: titleLableView)
    }
    
    func setUpColor(){
        containerView.backgroundColor = UIColor.clear
        titleLableView.textColor = UIColor.FlatColor.Menu.green
        notificationView.backgroundColor = UIColor.FlatColor.Menu.notificationBackground
        notificationLabel.textColor = UIColor.white
    }
}
