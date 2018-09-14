//
//  PizzaDetailsCollectionViewCell.swift
//  Pizzed
//
//  Created by Gone on 9/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class PizzaDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageContainView: UIView!
    @IBOutlet weak var contentContainView: UIView!
    @IBOutlet weak var titleContainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailContainView: UIView!
    @IBOutlet weak var orderBntContainView: UIView!
    @IBOutlet weak var dissmissButton: UIButton!
    @IBOutlet weak var compositionLabel: UILabel!
    @IBOutlet weak var compositionText: UITextView!
    @IBOutlet weak var nutriInfoLabel: UILabel!
    @IBOutlet weak var nutriInfoTableView: UITableView!
    @IBOutlet weak var descContainView: UIView!
    @IBOutlet weak var tradiDoughLabel: UILabel!
    
    @IBOutlet weak var sizeItemTitleLabel: UILabel!
    @IBOutlet weak var sizeItemLabel: UILabel!
    @IBOutlet weak var weightItemLabel: UILabel!
    @IBOutlet weak var weightItemTitleLabel: UILabel!
    let cellId = "cellId"
    let testString = "Italian flour, mozzarella, creamsauce, turkey, orange, almonds, green mix, cranberry, orange mustard"
    override func setNeedsLayout() {
        setupLayout()
        setupColours()
        tableViewSetup()
    }
    func tableViewSetup() {
        nutriInfoTableView.delegate = (self as UITableViewDelegate)
        nutriInfoTableView.dataSource = (self as UITableViewDataSource)
        nutriInfoTableView.register(nutriInfoTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    func setupLayout() {
        imageContainView.translatesAutoresizingMaskIntoConstraints = false
        imageContainView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageContainView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imageContainView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        imageContainView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.34).isActive = true
        imageContainView.backgroundColor = UIColor.FlatColor.Background.ItemsBackground
        imageContainView.addSubview(dissmissButton)
        dissmissButton.translatesAutoresizingMaskIntoConstraints = false
        dissmissButton.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 5).isActive = true
        dissmissButton.leftAnchor.constraint(equalTo: imageContainView.leftAnchor, constant: 2).isActive = true
        dissmissButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dissmissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        contentContainView.translatesAutoresizingMaskIntoConstraints = false
        contentContainView.topAnchor.constraint(equalTo: imageContainView.bottomAnchor, constant: 5).isActive = true
        contentContainView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        contentContainView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        contentContainView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        contentContainView.addSubview(titleContainView)
        contentContainView.addSubview(detailContainView)
        contentContainView.addSubview(orderBntContainView)
        titleContainView.translatesAutoresizingMaskIntoConstraints = false
        titleContainView.topAnchor.constraint(equalTo: contentContainView.topAnchor).isActive = true
        titleContainView.leftAnchor.constraint(equalTo: contentContainView.leftAnchor).isActive = true
        titleContainView.heightAnchor.constraint(equalTo: contentContainView.heightAnchor, multiplier: 0.1).isActive = true
        titleContainView.widthAnchor.constraint(equalTo: contentContainView.widthAnchor, multiplier: 1).isActive = true
        titleContainView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleContainView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: titleContainView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: titleContainView.rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleContainView.bottomAnchor).isActive = true
        titleLabel.formatTextMainLabelTitle(named: titleLabel, title: "Chicken with turkey")
        detailContainView.translatesAutoresizingMaskIntoConstraints = false
        detailContainView.topAnchor.constraint(equalTo: titleContainView.bottomAnchor, constant: 5).isActive = true
        detailContainView.leftAnchor.constraint(equalTo: contentContainView.leftAnchor).isActive = true
        detailContainView.rightAnchor.constraint(equalTo: contentContainView.rightAnchor).isActive = true
        detailContainView.heightAnchor.constraint(equalTo: contentContainView.heightAnchor, multiplier: 0.72).isActive = true
        detailContainView.addSubview(compositionLabel)
        detailContainView.addSubview(compositionText)
        detailContainView.addSubview(nutriInfoLabel)
        detailContainView.addSubview(nutriInfoTableView)
        detailContainView.addSubview(descContainView)
        detailContainView.addSubview(tradiDoughLabel)
        compositionLabel.translatesAutoresizingMaskIntoConstraints = false
        compositionLabel.topAnchor.constraint(equalTo: detailContainView.topAnchor, constant: 2).isActive = true
        compositionLabel.leftAnchor.constraint(equalTo: detailContainView.leftAnchor, constant: 2).isActive = true
        compositionLabel.widthAnchor.constraint(equalTo: detailContainView.widthAnchor, multiplier: 1).isActive = true
        compositionLabel.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.06).isActive = true
        compositionLabel.formatTextLabelTitle(named: compositionLabel, title: "Composition: ")
        compositionText.translatesAutoresizingMaskIntoConstraints = false
        compositionText.topAnchor.constraint(equalTo: compositionLabel.bottomAnchor, constant: 10).isActive = true
        compositionText.leftAnchor.constraint(equalTo: detailContainView.leftAnchor).isActive = true
        compositionText.rightAnchor.constraint(equalTo: detailContainView.rightAnchor).isActive = true
        compositionText.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.2).isActive = true
        compositionText.text = testString
        compositionText.formatTextViewContent(named: compositionText)
        nutriInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        nutriInfoLabel.topAnchor.constraint(equalTo: compositionText.bottomAnchor, constant: 10).isActive = true
        nutriInfoLabel.leftAnchor.constraint(equalTo: detailContainView.leftAnchor, constant: 2).isActive = true
        nutriInfoLabel.widthAnchor.constraint(equalTo: detailContainView.widthAnchor, multiplier: 1).isActive = true
        nutriInfoLabel.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.06).isActive = true
        nutriInfoLabel.formatTextLabelTitle(named: nutriInfoLabel, title: "Nutritional information per 100 g:")
        nutriInfoTableView.translatesAutoresizingMaskIntoConstraints  = false
        nutriInfoTableView.topAnchor.constraint(equalTo: nutriInfoLabel.bottomAnchor, constant: 5).isActive = true
        nutriInfoTableView.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.3).isActive = true
        nutriInfoTableView.rightAnchor.constraint(equalTo: detailContainView.rightAnchor, constant: -2).isActive = true
        nutriInfoTableView.leftAnchor.constraint(equalTo: detailContainView.leftAnchor, constant: 4).isActive = true

        descContainView.translatesAutoresizingMaskIntoConstraints = false
        descContainView.topAnchor.constraint(equalTo: nutriInfoTableView.bottomAnchor, constant: 5).isActive = true
        descContainView.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.1).isActive = true
        descContainView.rightAnchor.constraint(equalTo: detailContainView.rightAnchor, constant: -2).isActive = true
        descContainView.leftAnchor.constraint(equalTo: detailContainView.leftAnchor, constant: 2).isActive = true
        descContainView.addSubview(sizeItemTitleLabel)
        descContainView.addSubview(weightItemTitleLabel)
        descContainView.addSubview(sizeItemLabel)
        descContainView.addSubview(weightItemLabel)
        sizeItemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeItemTitleLabel.topAnchor.constraint(equalTo: descContainView.topAnchor).isActive = true
        sizeItemTitleLabel.leftAnchor.constraint(equalTo: descContainView.leftAnchor).isActive = true
        sizeItemTitleLabel.bottomAnchor.constraint(equalTo: descContainView.bottomAnchor).isActive = true
        sizeItemTitleLabel.widthAnchor.constraint(equalTo: descContainView.widthAnchor, multiplier: 0.2).isActive = true
        sizeItemTitleLabel.formatTextLabelTitle(named: sizeItemTitleLabel, title: "Size:")
        sizeItemLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeItemLabel.topAnchor.constraint(equalTo: descContainView.topAnchor).isActive = true
        sizeItemLabel.leftAnchor.constraint(equalTo: sizeItemTitleLabel.rightAnchor).isActive = true
        sizeItemLabel.bottomAnchor.constraint(equalTo: descContainView.bottomAnchor).isActive = true
        sizeItemLabel.widthAnchor.constraint(equalTo: descContainView.widthAnchor, multiplier: 0.3).isActive = true
        sizeItemLabel.formatTextLableContent(named: sizeItemLabel)
        sizeItemLabel.textAlignment = .left
        sizeItemLabel.text = "30 cm"
        weightItemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weightItemTitleLabel.topAnchor.constraint(equalTo: descContainView.topAnchor).isActive = true
        weightItemTitleLabel.leftAnchor.constraint(equalTo: sizeItemLabel.rightAnchor, constant: 5).isActive = true
        weightItemTitleLabel.bottomAnchor.constraint(equalTo: descContainView.bottomAnchor).isActive = true
        weightItemTitleLabel.widthAnchor.constraint(equalTo: descContainView.widthAnchor, multiplier: 0.2).isActive = true
        weightItemTitleLabel.textAlignment = .left
        weightItemTitleLabel.formatTextLabelTitle(named: weightItemTitleLabel, title: "Weight:")
        weightItemLabel.translatesAutoresizingMaskIntoConstraints = false
        weightItemLabel.topAnchor.constraint(equalTo: descContainView.topAnchor).isActive = true
        weightItemLabel.leftAnchor.constraint(equalTo: weightItemTitleLabel.rightAnchor).isActive = true
        weightItemLabel.bottomAnchor.constraint(equalTo: descContainView.bottomAnchor).isActive = true
        weightItemLabel.widthAnchor.constraint(equalTo: descContainView.widthAnchor, multiplier: 0.25).isActive = true
        weightItemLabel.textAlignment = .center
        weightItemLabel.formatTextLableContent(named: weightItemLabel)
        weightItemLabel.text = "480 ± 50g"
        tradiDoughLabel.translatesAutoresizingMaskIntoConstraints = false
        tradiDoughLabel.topAnchor.constraint(equalTo: descContainView.bottomAnchor, constant: 5).isActive = true
        tradiDoughLabel.heightAnchor.constraint(equalTo: detailContainView.heightAnchor, multiplier: 0.06).isActive = true
        tradiDoughLabel.rightAnchor.constraint(equalTo: detailContainView.rightAnchor, constant: -2).isActive = true
        tradiDoughLabel.leftAnchor.constraint(equalTo: detailContainView.leftAnchor, constant: 2).isActive = true
        tradiDoughLabel.formatTextLableContent(named: tradiDoughLabel)
        tradiDoughLabel.text = "Traditional dough"
        orderBntContainView.translatesAutoresizingMaskIntoConstraints = false
        orderBntContainView.topAnchor.constraint(equalTo: detailContainView.bottomAnchor).isActive = true
        orderBntContainView.leftAnchor.constraint(equalTo: contentContainView.leftAnchor).isActive = true
        orderBntContainView.rightAnchor.constraint(equalTo: contentContainView.rightAnchor).isActive = true
        orderBntContainView.heightAnchor.constraint(equalTo: contentContainView.heightAnchor, multiplier: 0.12).isActive = true
    }
    func setupColours() {
        contentContainView.backgroundColor  = UIColor.clear
        titleContainView.backgroundColor = UIColor.clear
        titleLabel.backgroundColor = UIColor.clear
        detailContainView.backgroundColor  = UIColor.clear
        compositionLabel.backgroundColor = UIColor.clear
        compositionText.backgroundColor = UIColor.clear
        nutriInfoLabel.backgroundColor = UIColor.clear
        nutriInfoTableView.separatorColor = UIColor.clear
        nutriInfoTableView.backgroundColor = UIColor.clear
        descContainView.backgroundColor = UIColor.clear
        tradiDoughLabel.backgroundColor = UIColor.clear
    }
}
extension PizzaDetailsCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! nutriInfoTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

class nutriInfoTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // creating a label to display some dummy text
    let label: UILabel = {
        let label = UILabel()
        label.text = "Calories ...................300 kcal"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.formatTextLableContent(named: label)
        return label
    }()
    func setUpViews() {
        addSubview(label)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
    }
}
