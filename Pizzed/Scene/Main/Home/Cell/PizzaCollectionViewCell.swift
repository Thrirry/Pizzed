//
//  PizzaCollectionViewCell.swift
//  Pizzed
//
//  Created by Gone on 10/21/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class PizzaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainContrainView: UIView!
    @IBOutlet weak var imageContainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dismissBtn: UIButton!
    
    @IBOutlet weak var contentContainView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailContentView: UIView!
    @IBOutlet weak var compositionLabel: UILabel!
    @IBOutlet weak var compositionTV: UITextView!
    
    @IBOutlet weak var nutritionalLabel: UILabel!
    @IBOutlet weak var nutritionalTable: UITableView!
    
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightTextLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeTextLabel: UILabel!
    
    @IBOutlet weak var tradDoughLabel: UILabel!
    
    @IBOutlet weak var orderContainView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var orderBtnView: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    
    var cellId = "cellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setNeedsLayout() {
        setupColor()
        tableViewSetup()
        setupUIs()
    }
    
    func setupUIs(){
        mainContrainView.translatesAutoresizingMaskIntoConstraints = false
        mainContrainView.addSubview(imageContainView)
        setupImageView()
        mainContrainView.addSubview(contentContainView)
        setupContentView()
    }
    
    var pizza: PizzaDetail! {
        didSet{
            guard let pizza = pizza else {return}
            titleLabel.formatTextMainLabelLargeTitle(named: titleLabel, title: pizza.name ?? "")
            
            print("Test for pizzacolectionViewCell \(String(describing: pizza.name))")
            
            let url = URL(string: pizza.detail?.firstImg ?? "")
            imageView.kf.setImage(with: url)
            
            compositionTV.formatTVContent(named: compositionTV, title: pizza.detail?.composition ?? "")
            
            guard let price = pizza.detail?.price else {return}
            priceLabel.text = String(describing: "$" + "\(price)")
        }
    }
    
    // MARK: - Setup item image view
    func setupImageView() {
        imageContainView.translatesAutoresizingMaskIntoConstraints = false
        imageContainView.topAnchor.constraint(equalTo: mainContrainView.topAnchor).isActive = true

        imageContainView.leftAnchor.constraint(equalTo: mainContrainView.leftAnchor, constant: 10).isActive = true
        imageContainView.rightAnchor.constraint(equalTo: mainContrainView.rightAnchor, constant: -10).isActive = true
        imageContainView.heightAnchor.constraint(equalTo: mainContrainView.heightAnchor, multiplier: 0.34).isActive = true
        
        imageContainView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageContainView.heightAnchor, multiplier: 1).isActive = true
        imageView.contentMode = .scaleAspectFit

        // Dissmiss button
        imageContainView.addSubview(dismissBtn)
        dismissBtn.translatesAutoresizingMaskIntoConstraints = false
        dismissBtn.heightAnchor.constraint(equalToConstant: 17).isActive = true
        dismissBtn.widthAnchor.constraint(equalToConstant: 17).isActive = true
        dismissBtn.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 7).isActive = true
        dismissBtn.leftAnchor.constraint(equalTo: imageContainView.leftAnchor, constant: 7).isActive = true
    }
    
    func setupContentView(){
        contentContainView.translatesAutoresizingMaskIntoConstraints = false
        contentContainView.topAnchor.constraint(equalTo: imageContainView.bottomAnchor).isActive = true
        
        contentContainView.leftAnchor.constraint(equalTo: mainContrainView.leftAnchor, constant: 10).isActive = true
        contentContainView.rightAnchor.constraint(equalTo: mainContrainView.rightAnchor, constant: -10).isActive = true
        contentContainView.heightAnchor.constraint(equalTo: mainContrainView.heightAnchor, multiplier: 0.66).isActive = true
        
        contentContainView.addSubview(titleView)
        setupTitle()
        
        contentContainView.addSubview(detailContentView)
        setupDetails()
    }
    
    func setupTitle(){
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: contentContainView.topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: contentContainView.leftAnchor, constant: 0).isActive = true
        titleView.heightAnchor.constraint(equalTo: contentContainView.heightAnchor, multiplier: 0.12).isActive = true
        titleView.widthAnchor.constraint(equalTo: contentContainView.widthAnchor, multiplier: 1).isActive = true
        
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
//        titleLabel.formatTextMainLabelLargeTitle(named: titleLabel, title: "Chicken with turkey")
    }
    
    func setupDetails(){
        detailContentView.translatesAutoresizingMaskIntoConstraints = false
        detailContentView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        
        detailContentView.leftAnchor.constraint(equalTo: contentContainView.leftAnchor, constant: 5).isActive = true
        detailContentView.rightAnchor.constraint(equalTo: contentContainView.rightAnchor, constant: -5).isActive = true
        detailContentView.heightAnchor.constraint(equalTo: contentContainView.heightAnchor, multiplier: 0.85).isActive = true
        
        detailContentView.addSubview(compositionLabel)
        detailContentView.addSubview(compositionTV)
        setupComposition()
        detailContentView.addSubview(nutritionalLabel)
        detailContentView.addSubview(nutritionalTable)
        setupNutritional()
        
        detailContentView.addSubview(descriptionView)
        descriptionView.addSubview(weightLabel)
        descriptionView.addSubview(weightTextLabel)
        descriptionView.addSubview(sizeLabel)
        descriptionView.addSubview(sizeTextLabel)
        setupDescription()
        
        detailContentView.addSubview(tradDoughLabel)
        setupTraditionalDoughLayout()
        
        detailContentView.addSubview(orderContainView)
        setupOrder()
    }
    
    func setupComposition(){
        compositionLabel.translatesAutoresizingMaskIntoConstraints = false
        compositionLabel.topAnchor.constraint(equalTo: detailContentView.topAnchor, constant: 2).isActive = true
        compositionLabel.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 2).isActive = true
        compositionLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 1).isActive = true
        compositionLabel.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.06).isActive = true
        compositionLabel.formatTextMainLabelTitle(named: compositionLabel, title: "Composition: ")
        
        compositionTV.translatesAutoresizingMaskIntoConstraints = false
        compositionTV.topAnchor.constraint(equalTo: compositionLabel.bottomAnchor, constant: 10).isActive = true
        compositionTV.leftAnchor.constraint(equalTo: detailContentView.leftAnchor).isActive = true
        compositionTV.rightAnchor.constraint(equalTo: detailContentView.rightAnchor).isActive = true
        compositionTV.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.15).isActive = true
//        compositionTV.formatTextViewContent(named: compositionTV, title: "")
    }
    
    func setupNutritional() {
        // Setup nutritional infotional per item label view
        nutritionalLabel.translatesAutoresizingMaskIntoConstraints = false
        nutritionalLabel.topAnchor.constraint(equalTo: compositionTV.bottomAnchor, constant: 10).isActive = true
        nutritionalLabel.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 2).isActive = true
        nutritionalLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 1).isActive = true
        nutritionalLabel.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.06).isActive = true
        nutritionalLabel.formatTextMainLabelTitle(named: nutritionalLabel, title: "Nutritional information per 100 g:")
        
        // Setup nutritional infotional per item table view
        nutritionalTable.translatesAutoresizingMaskIntoConstraints  = false
        nutritionalTable.topAnchor.constraint(equalTo: nutritionalLabel.bottomAnchor, constant: 5).isActive = true
        nutritionalTable.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.25).isActive = true
        nutritionalTable.rightAnchor.constraint(equalTo: detailContentView.rightAnchor, constant: -2).isActive = true
        nutritionalTable.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 4).isActive = true
    }
    
    func tableViewSetup() {
        nutritionalTable.delegate = (self as UITableViewDelegate)
        nutritionalTable.dataSource = (self as UITableViewDataSource)
        nutritionalTable.register(NutriInfoTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupDescription(){
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: nutritionalTable.bottomAnchor, constant: 5).isActive = true
        descriptionView.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.1).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: detailContentView.rightAnchor, constant: -2).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 2).isActive = true
        // Setup size item view - Description
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        sizeLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor).isActive = true
        sizeLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        sizeLabel.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 0.2).isActive = true
        sizeLabel.formatTextMainLabelTitle(named: sizeLabel, title: "Size:")
        sizeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeTextLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        sizeTextLabel.leftAnchor.constraint(equalTo: sizeLabel.rightAnchor).isActive = true
        sizeTextLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        sizeTextLabel.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 0.2).isActive = true
        sizeTextLabel.formatTextLableContent(named: sizeTextLabel)
        sizeTextLabel.textAlignment = .left

        // Setup weight item view - Description
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor).isActive = true
        weightLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor).isActive = true
        weightLabel.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 0.3).isActive = true
        weightLabel.formatTextMainLabelTitle(named: weightLabel, title: "Weight:")
        weightLabel.textAlignment = .right
        weightTextLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        weightTextLabel.leftAnchor.constraint(equalTo: weightLabel.rightAnchor).isActive = true
        weightTextLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        weightTextLabel.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 0.3).isActive = true
        weightTextLabel.formatTextLableContent(named: weightTextLabel)
        weightTextLabel.textAlignment = .right
    }
    
    func setupTraditionalDoughLayout() {
        // Setup Traditional View
        tradDoughLabel.translatesAutoresizingMaskIntoConstraints = false
        tradDoughLabel.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 5).isActive = true
        tradDoughLabel.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.06).isActive = true
        tradDoughLabel.rightAnchor.constraint(equalTo: detailContentView.rightAnchor, constant: -2).isActive = true
        tradDoughLabel.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 2).isActive = true
        tradDoughLabel.formatTextMainLabelTitle(named: tradDoughLabel, title: "Traditional dough")
    }
    
    func setupOrder(){
        orderContainView.translatesAutoresizingMaskIntoConstraints = false
        orderContainView.topAnchor.constraint(equalTo: tradDoughLabel.bottomAnchor, constant: 20).isActive = true
        orderContainView.leftAnchor.constraint(equalTo: detailContentView.leftAnchor, constant: 2).isActive = true
        orderContainView.rightAnchor.constraint(equalTo: detailContentView.rightAnchor, constant: -2).isActive = true
        orderContainView.heightAnchor.constraint(equalTo: detailContentView.heightAnchor, multiplier: 0.15).isActive = true
        orderContainView.layer.borderWidth = 1
        
        orderContainView.addSubview(orderBtnView)
        orderContainView.addSubview(priceView)
        
        orderBtnView.translatesAutoresizingMaskIntoConstraints = false
        orderBtnView.topAnchor.constraint(equalTo: orderContainView.topAnchor).isActive = true
        orderBtnView.rightAnchor.constraint(lessThanOrEqualTo: orderContainView.rightAnchor).isActive = true
        orderBtnView.bottomAnchor.constraint(equalTo: orderContainView.bottomAnchor).isActive = true
        orderBtnView.widthAnchor.constraint(equalTo: orderContainView.widthAnchor, multiplier: 0.5).isActive = true
        orderBtnView.layer.borderWidth = 1
        
        orderBtnView.addSubview(orderBtn)
        orderBtn.translatesAutoresizingMaskIntoConstraints = false
        orderBtn.centerXAnchor.constraint(equalTo: orderBtnView.centerXAnchor).isActive = true
        orderBtn.centerYAnchor.constraint(equalTo: orderBtnView.centerYAnchor).isActive = true
        orderBtn.heightAnchor.constraint(equalTo: orderBtnView.heightAnchor, multiplier: 0.7).isActive = true
        orderBtn.widthAnchor.constraint(equalTo: orderBtnView.widthAnchor, multiplier: 0.25).isActive = true

        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.topAnchor.constraint(equalTo: orderContainView.topAnchor).isActive = true
        priceView.leftAnchor.constraint(lessThanOrEqualTo: orderContainView.leftAnchor).isActive = true
        priceView.bottomAnchor.constraint(equalTo: orderContainView.bottomAnchor).isActive = true
        priceView.widthAnchor.constraint(equalTo: orderContainView.widthAnchor, multiplier: 0.5).isActive = true
    
        priceView.leftAnchor.constraint(lessThanOrEqualTo: orderContainView.leftAnchor).isActive = true
        priceView.bottomAnchor.constraint(equalTo: orderContainView.bottomAnchor).isActive = true
        priceView.widthAnchor.constraint(equalTo: orderContainView.widthAnchor, multiplier: 0.5).isActive = true

        priceView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor).isActive = true
    }
    
    func setupColor(){
        mainContrainView.backgroundColor = UIColor.FlatColor.mainBackground
        imageContainView.backgroundColor = UIColor.FlatColor.Product.background
        imageView.backgroundColor = UIColor.clear
        
        titleView.backgroundColor = UIColor.clear
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.FlatColor.mainTitle
        detailContentView.backgroundColor = UIColor.clear
        compositionTV.backgroundColor = UIColor.clear
        compositionLabel.backgroundColor = UIColor.clear
        
        nutritionalTable.backgroundColor = UIColor.clear
        descriptionView.backgroundColor = UIColor.clear
        weightTextLabel.backgroundColor = UIColor.clear
        weightLabel.backgroundColor = UIColor.clear
        sizeTextLabel.backgroundColor = UIColor.clear
        sizeLabel.backgroundColor = UIColor.clear
        
        orderContainView.backgroundColor = UIColor.clear
        
        orderBtnView.backgroundColor = UIColor.clear
        orderBtnView.layer.borderColor = UIColor.FlatColor.Product.borderButton.cgColor
        priceView.backgroundColor = UIColor.FlatColor.mainBackground
        priceLabel.backgroundColor = UIColor.clear
    }
}

extension PizzaCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NutriInfoTableViewCell else {
            fatalError("NutriInfoTableViewCell has not been implemented")
        }
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}
