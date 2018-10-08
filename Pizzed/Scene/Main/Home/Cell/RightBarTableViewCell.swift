//
//  RighBarTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class RightBarTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabelView: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "RightBarTableViewCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        setupColour()
    }
    func displayContent(image: String, title: String) {
        iconImageView.pin_updateWithProgress = true
        guard let url = URL(string: image) else {
            return
        }
        iconImageView.pin_setImage(from: url)
        titleLabelView.text = title
    }
    func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9).isActive = true
        containerView.addSubview(iconContainerView)
        containerView.addSubview(titleContainerView)
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        iconContainerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        iconContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        iconContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        iconContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        iconContainerView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconContainerView.heightAnchor, multiplier: 0.9).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconContainerView.widthAnchor, multiplier: 0.9).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleContainerView.topAnchor.constraint(equalTo: iconContainerView.bottomAnchor).isActive = true
        titleContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        titleContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        titleContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        titleContainerView.addSubview(titleLabelView)
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.topAnchor.constraint(equalTo: titleContainerView.topAnchor).isActive = true
        titleLabelView.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor).isActive = true
        titleLabelView.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor).isActive = true
        titleLabelView.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor).isActive = true
        formatTextLabelTitle(named: titleLabelView)
    }
    func setupColour() {
        containerView.backgroundColor = UIColor.FlatColor.Background.RightBarBackground
        iconContainerView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        titleContainerView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
    }
    func formatTextLabelTitle(named: UILabel) {
        named.sizeToFit()
        named.numberOfLines = 0
        named.textAlignment  = .center
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
}
