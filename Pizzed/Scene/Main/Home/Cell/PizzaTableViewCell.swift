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
    @IBOutlet weak var mainContainView: UIView!
    @IBOutlet weak var imageContainView: UIView!
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
    func displayTitle(title: String, state: String ) {
        itemImageView.pin_updateWithProgress = true
        titleItemLabel.text = title
        if state == "new" {
            newsBtn.setBackgroundImageForButton(urlImg: "btnNewActive", btnNamed: newsBtn)
        }
    }
    func displayComposition(composition: String) {
        contentItemTV.text = composition
    }
    
    func  displayProductImage(image: String) {
        guard let url = URL(string: image) else {
            return
        }
        itemImageView.pin_setImage(from: url)
    }
    func displayDescription(weight: String, size: String, price: Int){
        sizeItemLabel.text = size
        priceItemLabel.text = String(String(price) + "$")
    }
    
    func setupItemImageLayout() {
        // Setup image contain view
        imageContainView.translatesAutoresizingMaskIntoConstraints = false
        imageContainView.leftAnchor.constraint(equalTo: mainContainView.leftAnchor).isActive = true
        imageContainView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 1).isActive = true
        imageContainView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 0.49).isActive = true
        imageContainView.addSubview(itemImageView)
        // Setup item image view
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: imageContainView.heightAnchor, multiplier: 1).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: imageContainView.widthAnchor, multiplier: 1).isActive = true
        itemImageView.contentMode = .scaleAspectFit
        imageContainView.addSubview(reactBtn)
        reactBtn.translatesAutoresizingMaskIntoConstraints = false
        reactBtn.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 7).isActive = true
        reactBtn.leftAnchor.constraint(equalTo: imageContainView.leftAnchor, constant: 7).isActive = true
        reactBtn.heightAnchor.constraint(equalToConstant: 18.5).isActive = true
        reactBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        reactBtn.setBackgroundImageForButton(urlImg: "btnLike", btnNamed: reactBtn)
//        let reactLikeBtn = UIImage(named: "btnLike")
//        reactBtn.setBackgroundImage(reactLikeBtn, for: .normal)
        
        imageContainView.addSubview(newsBtn)
        newsBtn.translatesAutoresizingMaskIntoConstraints = false
        newsBtn.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 6).isActive = true
        newsBtn.rightAnchor.constraint(equalTo: imageContainView.rightAnchor, constant: -6).isActive = true
        newsBtn.heightAnchor.constraint(equalToConstant: 20.5).isActive = true
        newsBtn.widthAnchor.constraint(equalToConstant: 20.5).isActive = true
        mainContainView.addSubview(contentContainerView)
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 1).isActive = true
        contentContainerView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 0.49).isActive = true
        contentContainerView.rightAnchor.constraint(equalTo: mainContainView.rightAnchor).isActive = true
    }
    func setupTitleLayout() {
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
    }
    func setupContentLayout() {
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
    }
    func setupDescriptionLayout(){
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
    }
    func setupOrderLayout(){
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
        
        let orderBtnNamed = UIImage(named: "btnPizzaCutter")
        orderBtn.setImage(orderBtnNamed, for: .normal)
        
        orderBtn.contentMode = .scaleAspectFit
        orderBtn.tintColor = UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1.0)
        orderBtn.titleLabel?.isHidden = true
        orderBtn.setTitleColor(UIColor.clear, for: UIControlState.normal)
    }
    // MARK: - Setup layout for UIView
    func setupLayout() {
        // Setup main contain view
        mainContainView.translatesAutoresizingMaskIntoConstraints = false
        mainContainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainContainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainContainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainContainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        mainContainView.addSubview(imageContainView)
        setupItemImageLayout()
        contentContainerView.addSubview(titleItemView)
        contentContainerView.addSubview(contentItemView)
        contentContainerView.addSubview(descItemView)
        contentContainerView.addSubview(orderView)
        contentContainerView.addSubview(spaceView)
        setupTitleLayout()
        setupContentLayout()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.05).isActive = true
        spaceView.widthAnchor.constraint(equalTo: contentContainerView.widthAnchor, multiplier: 1).isActive = true
        spaceView.topAnchor.constraint(equalTo: contentItemView.bottomAnchor).isActive = true
        spaceView.rightAnchor.constraint(equalTo: contentContainerView.rightAnchor).isActive = true
        setupDescriptionLayout()
        setupOrderLayout()
    }
    func formatTextTVContent(named: UITextView) {
        named.sizeToFit()
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        guard let fontSize = named.font?.pointSize else {
            return
        }
        named.font = UIFont(name: "Dosis-Medium", size: fontSize)
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
        mainContainView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        imageContainView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
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
