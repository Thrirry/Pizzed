//
//  ProductViewController.swift
//  Pizzed
//
//  Created by Gone on 9/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupUIs()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "PizzaDetailsCollectionViewCell", bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "PizzaDetailsCollectionViewCell")
    }
    
    private func configureCollectionView() {
        registerCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaDetailsCollectionViewCell", for: indexPath) as? PizzaDetailsCollectionViewCell else {
            fatalError()
        }
        
        cell.dissmissButton.addTarget(self, action: #selector(onCloseCollectionClick(_:)), for: .touchUpInside)
        return cell
        
    }
    
    func setupUIs() {
        productCollectionView.isPagingEnabled = true
        let itemWidthSize = UIScreen.main.bounds.width
        let itemHeightSize = UIScreen.main.bounds.height
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidthSize, height: itemHeightSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        productCollectionView.collectionViewLayout = layout
        
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productCollectionView.backgroundColor = UIColor.FlatColor.Background.ProductDetailBackground
    }
}
