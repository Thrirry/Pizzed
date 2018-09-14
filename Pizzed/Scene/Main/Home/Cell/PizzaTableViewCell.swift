//
//  PizzaTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import PINRemoteImage

class PizzaTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleItemView: UIView!
    @IBOutlet weak var titleItemLabel: UILabel!
    @IBOutlet weak var contentItemView: UIView!
    @IBOutlet weak var contentItemTV: UITextView!
    @IBOutlet weak var descItemView: UIView!
    @IBOutlet weak var sizeItemLabel: UILabel!
    @IBOutlet weak var priceItemLabel: UILabel!
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var reactBtn: UIButton!
    @IBOutlet weak var newsBtn: UIButton!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "PizzaTableViewCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        setupColour()
    }
    // MARK: - Displaying Contents
    func displayContent(image: String, title: String, price: String, size: String, content: String, idpizza: String, state: String ) {
        itemImageView.pin_updateWithProgress = true
        itemImageView.pin_setImage(from: URL(string: image)!)
        titleItemLabel.text = title
        contentItemTV.text = content
        sizeItemLabel.text = size
        priceItemLabel.text = price + " $"
        if state == "new" {
            newsBtn.setBackgroundImage(#imageLiteral(resourceName: "newed"), for: UIControlState.normal)
        }
    }
    func setupLayout() {
        // MARK: - Setup Content layout
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        containerView.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        imageContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.49).isActive = true
        imageContainerView.addSubview(itemImageView)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 1).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 1).isActive = true
        itemImageView.contentMode = .scaleAspectFit
        imageContainerView.addSubview(reactBtn)
        reactBtn.translatesAutoresizingMaskIntoConstraints = false
        reactBtn.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 7).isActive = true
        reactBtn.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor, constant: 7).isActive = true
        reactBtn.heightAnchor.constraint(equalToConstant: 18.5).isActive = true
        reactBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        reactBtn.setBackgroundImage(#imageLiteral(resourceName: "like"), for: .normal)

        imageContainerView.addSubview(newsBtn)
        newsBtn.translatesAutoresizingMaskIntoConstraints = false
        newsBtn.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 6).isActive = true
        newsBtn.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor, constant: -6).isActive = true
        newsBtn.heightAnchor.constraint(equalToConstant: 20.5).isActive = true
        newsBtn.widthAnchor.constraint(equalToConstant: 20.5).isActive = true
        containerView.addSubview(contentContainerView)
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        contentContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.49).isActive = true
        contentContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true

        contentContainerView.addSubview(titleItemView)
        contentContainerView.addSubview(contentItemView)
        contentContainerView.addSubview(descItemView)
        contentContainerView.addSubview(orderView)
        contentContainerView.addSubview(spaceView)
        titleItemView.translatesAutoresizingMaskIntoConstraints = false
        titleItemView.topAnchor.constraint(equalTo: contentContainerView.topAnchor).isActive = true
        titleItemView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        titleItemView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.2).isActive = true
        titleItemView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        titleItemView.addSubview(titleItemLabel)
        titleItemLabel.translatesAutoresizingMaskIntoConstraints = false
        titleItemLabel.topAnchor.constraint(equalTo: titleItemView.topAnchor, constant: 0).isActive = true
        titleItemLabel.rightAnchor.constraint(equalTo: titleItemView.rightAnchor).isActive = true
        titleItemLabel.bottomAnchor.constraint(equalTo: titleItemView.bottomAnchor).isActive = true
        titleItemLabel.leftAnchor.constraint(equalTo: titleItemView.leftAnchor).isActive = true
        formatTextLabelTitle(named: titleItemLabel)
        contentItemView.translatesAutoresizingMaskIntoConstraints = false
        contentItemView.topAnchor.constraint(equalTo: titleItemView.bottomAnchor).isActive = true
        contentItemView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        contentItemView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.5).isActive = true
        contentItemView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        contentItemView.addSubview(contentItemTV)
        contentItemTV.translatesAutoresizingMaskIntoConstraints = false
        contentItemTV.topAnchor.constraint(equalTo: contentItemView.topAnchor, constant: 0).isActive = true
        contentItemTV.rightAnchor.constraint(equalTo: contentItemView.rightAnchor).isActive = true
        contentItemTV.bottomAnchor.constraint(equalTo: contentItemView.bottomAnchor).isActive = true
        contentItemTV.leftAnchor.constraint(equalTo: contentItemView.leftAnchor, constant: -2).isActive = true
        contentItemTV.isUserInteractionEnabled = false
        contentItemTV.setContentOffset(.zero, animated: false)
        formatTextTVContent(named: contentItemTV)
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.05).isActive = true
        spaceView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        spaceView.topAnchor.constraint(equalTo: contentItemView.bottomAnchor).isActive = true
        spaceView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        descItemView.translatesAutoresizingMaskIntoConstraints = false
        descItemView.topAnchor.constraint(equalTo: spaceView.bottomAnchor).isActive = true
        descItemView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        descItemView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.1).isActive = true
        descItemView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        descItemView.addSubview(sizeItemLabel)
        descItemView.addSubview(priceItemLabel)
        sizeItemLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeItemLabel.topAnchor.constraint(equalTo: descItemView.topAnchor).isActive = true
        sizeItemLabel.leftAnchor.constraint(equalTo: descItemView.leftAnchor).isActive = true
        sizeItemLabel.bottomAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        sizeItemLabel.widthAnchor.constraint(equalTo: descItemView.widthAnchor, multiplier: 0.5).isActive = true
        formatTextLableContent(named: sizeItemLabel)
        priceItemLabel.translatesAutoresizingMaskIntoConstraints = false
        priceItemLabel.topAnchor.constraint(equalTo: descItemView.topAnchor).isActive = true
        priceItemLabel.rightAnchor.constraint(equalTo: descItemView.rightAnchor, constant: -2).isActive = true
        priceItemLabel.bottomAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        priceItemLabel.widthAnchor.constraint(equalTo: descItemView.widthAnchor, multiplier: 0.5).isActive = true
        priceItemLabel.textAlignment = .right
        formatTextLableContent(named: priceItemLabel)
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        orderView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.15).isActive = true
        orderView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        orderView.addSubview(orderBtn)
        orderBtn.translatesAutoresizingMaskIntoConstraints = false
        orderBtn.backgroundColor = UIColor.clear
        orderBtn.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
        orderBtn.centerXAnchor.constraint(equalTo: orderView.centerXAnchor).isActive = true
        orderBtn.widthAnchor.constraint(equalToConstant: 27).isActive = true
        orderBtn.heightAnchor.constraint(equalToConstant: 27).isActive = true
        orderBtn.setImage(#imageLiteral(resourceName: "pizza-cutter-1"), for: UIControlState.normal)
        orderBtn.contentMode = .scaleAspectFit
        orderBtn.tintColor = UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1.0)
        orderBtn.titleLabel?.isHidden = true
        orderBtn.setTitleColor(UIColor.clear, for: UIControlState.normal)
    }
    func formatTextTVContent(named: UITextView) {
        named.sizeToFit()
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font?.pointSize
        named.font = UIFont(name: "Dosis-Medium", size: fontSize!)
    }
    func formatTextLableContent(named: UILabel) {
        named.sizeToFit()
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
    func formatTextLabelTitle(named: UILabel) {
        named.sizeToFit()
        named.numberOfLines = 0
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
    func setupColour() {
        containerView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        imageContainerView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        itemImageView.backgroundColor = UIColor.FlatColor.ItemProduct.BackgroundImage
        contentContainerView.backgroundColor = UIColor.FlatColor.ItemProduct.BackgroundContent
        titleItemView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        contentItemView.backgroundColor = UIColor.clear
        contentItemTV.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        descItemView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        spaceView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        orderView.backgroundColor = UIColor.FlatColor.ItemProduct.orderButton
    }
}
