//
//  ProductViewController.swift
//  Pizzed
//
//  Created by Gone on 9/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
protocol ItemDetailsDelegate {
    func itemDetailsDelegateSelectedAtIndex(_ index: Int32)
}

class ProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var productCollectionView: UICollectionView!
    var delegate: ItemDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PizzaDetailsCollectionViewCell", bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "PizzaDetailsCollectionViewCell")
        productCollectionView.isPagingEnabled = true
//        let itemSize = UIScreen.main.bounds.width / 1.31578947
        let itemWidthSize = UIScreen.main.bounds.width
        let itemHeightSize = UIScreen.main.bounds.height
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidthSize, height: itemHeightSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        productCollectionView.collectionViewLayout = layout

        setupLayout()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaDetailsCollectionViewCell", for: indexPath) as! PizzaDetailsCollectionViewCell
        return cell
    }
    func setupLayout() {
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productCollectionView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
    }
}
