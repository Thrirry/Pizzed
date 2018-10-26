//
//  PizzaTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import Kingfisher

class PizzaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainContainView: UIView!
    @IBOutlet weak var imageContainView: UIView!
    @IBOutlet weak var itemContentView: UIView!
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "PizzaTableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUIs()
        setupColor()
    }
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Displaying Contents
    var pizza: Pizza! {
        didSet {
            guard let pizza = pizza else {return}

            let url = URL(string: pizza.detail?.firstImg ?? "")
            itemImageView.kf.setImage(with: url)
            
            titleItemLabel.testTitle(named: titleItemLabel, title: pizza.name ?? "")
            
            if pizza.state == "new" {
                newsBtn.setBackgroundImageForButton(urlImg: "btnNewActive", btnNamed: newsBtn)
            }
            
            contentItemTV.text = pizza.detail?.composition
            
            let price = pizza.detail?.price
            priceItemLabel.text = String(describing:price ?? 0)
            sizeItemLabel.text = pizza.detail?.size
        }
    }
    
    let lineSpace: UILabel = {
        var line = UILabel()
        return line
    }()
    
    // MARK: - Setup layout for UIView
    func setupUIs() {
        // Setup main contain view
        mainContainView.translatesAutoresizingMaskIntoConstraints = false
        mainContainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainContainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainContainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainContainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        mainContainView.addSubview(lineSpace)
        mainContainView.addSubview(imageContainView)
        setupItemImageLayout()
        
        itemContentView.addSubview(titleItemView)
        itemContentView.addSubview(contentItemView)
        itemContentView.addSubview(descItemView)
        itemContentView.addSubview(orderView)
        itemContentView.addSubview(spaceView)
        setupTitleLayout()
        setupContentLayout()
        
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.heightAnchor.constraint(equalTo: itemContentView.heightAnchor, multiplier: 0.05).isActive = true
        spaceView.widthAnchor.constraint(equalTo: itemContentView.widthAnchor, multiplier: 1).isActive = true
        spaceView.topAnchor.constraint(equalTo: contentItemView.bottomAnchor).isActive = true
        spaceView.rightAnchor.constraint(equalTo: itemContentView.rightAnchor).isActive = true
        setupDescriptionLayout()
        setupOrderLayout()
    }
    
    func setupItemImageLayout() {
        imageContainView.translatesAutoresizingMaskIntoConstraints = false
        imageContainView.leftAnchor.constraint(equalTo: mainContainView.leftAnchor).isActive = true
        imageContainView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 0.9).isActive = true
        imageContainView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 0.49).isActive = true
        
        lineSpace.translatesAutoresizingMaskIntoConstraints = false
        lineSpace.centerXAnchor.constraint(equalTo: mainContainView.centerXAnchor).isActive = true
        lineSpace.topAnchor.constraint(equalTo: imageContainView.bottomAnchor).isActive = true
        lineSpace.drawLineView(label: lineSpace, view: mainContainView)
        
        // Setup item image view
        imageContainView.addSubview(itemImageView)
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
        
        imageContainView.addSubview(newsBtn)
        newsBtn.translatesAutoresizingMaskIntoConstraints = false
        newsBtn.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 6).isActive = true
        newsBtn.rightAnchor.constraint(equalTo: imageContainView.rightAnchor, constant: -6).isActive = true
        newsBtn.heightAnchor.constraint(equalToConstant: 20.5).isActive = true
        newsBtn.widthAnchor.constraint(equalToConstant: 20.5).isActive = true
        mainContainView.addSubview(itemContentView)
        itemContentView.translatesAutoresizingMaskIntoConstraints = false
        itemContentView.heightAnchor.constraint(equalTo: mainContainView.heightAnchor, multiplier: 0.9).isActive = true
        itemContentView.widthAnchor.constraint(equalTo: mainContainView.widthAnchor, multiplier: 0.49).isActive = true
        itemContentView.rightAnchor.constraint(equalTo: mainContainView.rightAnchor).isActive = true
    }
    
    func setupTitleLayout() {
        titleItemView.translatesAutoresizingMaskIntoConstraints = false
        titleItemView.topAnchor.constraint(equalTo: itemContentView.topAnchor).isActive = true
        titleItemView.leftAnchor.constraint(equalTo: itemContentView.leftAnchor).isActive = true
        titleItemView.heightAnchor.constraint(equalTo: itemContentView.heightAnchor, multiplier: 0.2).isActive = true
        titleItemView.widthAnchor.constraint(equalTo: itemContentView.widthAnchor, multiplier: 0.9).isActive = true
        
        titleItemView.addSubview(titleItemLabel)
        titleItemLabel.translatesAutoresizingMaskIntoConstraints = false
        titleItemLabel.topAnchor.constraint(equalTo: titleItemView.topAnchor, constant: 0).isActive = true
        titleItemLabel.rightAnchor.constraint(equalTo: titleItemView.rightAnchor).isActive = true
        titleItemLabel.bottomAnchor.constraint(equalTo: titleItemView.bottomAnchor).isActive = true
        titleItemLabel.leftAnchor.constraint(equalTo: titleItemView.leftAnchor).isActive = true
    }
    
    func setupContentLayout() {
        contentItemView.translatesAutoresizingMaskIntoConstraints = false
        contentItemView.topAnchor.constraint(equalTo: titleItemView.bottomAnchor).isActive = true
        contentItemView.rightAnchor.constraint(equalTo: itemContentView.rightAnchor).isActive = true
        contentItemView.heightAnchor.constraint(equalTo: itemContentView.heightAnchor, multiplier: 0.5).isActive = true
        contentItemView.widthAnchor.constraint(equalTo: itemContentView.widthAnchor, multiplier: 1).isActive = true
        contentItemView.addSubview(contentItemTV)
        contentItemTV.translatesAutoresizingMaskIntoConstraints = false
        contentItemTV.topAnchor.constraint(equalTo: contentItemView.topAnchor, constant: 0).isActive = true
        contentItemTV.rightAnchor.constraint(equalTo: contentItemView.rightAnchor).isActive = true
        contentItemTV.bottomAnchor.constraint(equalTo: contentItemView.bottomAnchor).isActive = true
        contentItemTV.leftAnchor.constraint(equalTo: contentItemView.leftAnchor, constant: -2).isActive = true
        contentItemTV.isUserInteractionEnabled = false
        contentItemTV.setContentOffset(.zero, animated: false)
    }
    
    func setupDescriptionLayout(){
        descItemView.translatesAutoresizingMaskIntoConstraints = false
        descItemView.topAnchor.constraint(equalTo: spaceView.bottomAnchor).isActive = true
        descItemView.rightAnchor.constraint(equalTo: itemContentView.rightAnchor).isActive = true
        descItemView.heightAnchor.constraint(equalTo: itemContentView.heightAnchor, multiplier: 0.1).isActive = true
        descItemView.widthAnchor.constraint(equalTo: itemContentView.widthAnchor, multiplier: 1).isActive = true
        
        descItemView.addSubview(sizeItemLabel)
        descItemView.addSubview(priceItemLabel)
        
        sizeItemLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeItemLabel.topAnchor.constraint(equalTo: descItemView.topAnchor).isActive = true
        sizeItemLabel.leftAnchor.constraint(equalTo: descItemView.leftAnchor).isActive = true
        sizeItemLabel.bottomAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        sizeItemLabel.widthAnchor.constraint(equalTo: descItemView.widthAnchor, multiplier: 0.5).isActive = true
        sizeItemLabel.formatTextLableContent(named: sizeItemLabel)
        
        priceItemLabel.translatesAutoresizingMaskIntoConstraints = false
        priceItemLabel.topAnchor.constraint(equalTo: descItemView.topAnchor).isActive = true
        priceItemLabel.rightAnchor.constraint(equalTo: descItemView.rightAnchor, constant: -2).isActive = true
        priceItemLabel.bottomAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        priceItemLabel.widthAnchor.constraint(equalTo: descItemView.widthAnchor, multiplier: 0.5).isActive = true
        priceItemLabel.textAlignment = .right
        priceItemLabel.formatTextLableContent(named: priceItemLabel)
    }
    
    func setupOrderLayout(){
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: descItemView.bottomAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: itemContentView.rightAnchor).isActive = true
        orderView.heightAnchor.constraint(equalTo: itemContentView.heightAnchor, multiplier: 0.15).isActive = true
        orderView.widthAnchor.constraint(equalTo: itemContentView.widthAnchor, multiplier: 1).isActive = true
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
        orderBtn.titleLabel?.isHidden = true
        orderBtn.setTitleColor(UIColor.clear, for: UIControlState.normal)
    }
    
    func setupColor() {
        mainContainView.backgroundColor = UIColor.FlatColor.Item.background
        imageContainView.backgroundColor = UIColor.clear
        itemImageView.backgroundColor = UIColor.clear
        itemContentView.backgroundColor = UIColor.FlatColor.Item.background
        titleItemView.backgroundColor = UIColor.clear
        contentItemView.backgroundColor = UIColor.clear
        contentItemTV.backgroundColor = UIColor.clear
        descItemView.backgroundColor = UIColor.clear
        spaceView.backgroundColor = UIColor.clear
        orderView.backgroundColor = UIColor.FlatColor.Item.orderButton
        orderBtn.tintColor = UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1.0)
    }
}
