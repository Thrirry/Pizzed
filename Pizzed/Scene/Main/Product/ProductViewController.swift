//
//  ProductViewController.swift
//  Pizzed
//
//  Created by Gone on 9/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ServicePlatform

class ProductViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var viewModel: ProductViewModel!
    let pizza = DataForPizza.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        pizza.fetchJSON { [weak self] in
            self?.productCollectionView.reloadData()
            count += 1
            if count == 1 {
                Helper.hideLoading()
            }
        }
        setupUIs()
        configureCollectionView()
        productCollectionView.delegate = self
    }

    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    static func viewController() -> ProductViewController? {
        return Helper.getViewController(named: "ProductViewController", inSb: "Main")
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "PizzaCollectionViewCell", bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "PizzaCollectionViewCell")
    }
    
    private func configureCollectionView() {
        registerCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pizza.serviceProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath) as? PizzaCollectionViewCell else {
            fatalError()
        }
        return cell
    }
    
    func setupCollectionView() {
        if let flowLayout = productCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
            let itemWidthSize = productCollectionView.bounds.width
            let itemHeightSize = productCollectionView.bounds.height
            flowLayout.itemSize = CGSize(width: itemWidthSize, height: itemHeightSize)
        }
        productCollectionView?.isPagingEnabled = true
    }
    
    func setupUIs() {
        productCollectionView.backgroundColor = UIColor(rgb: UInt(Constants.Product.Background))
        view.backgroundColor = UIColor(rgb: UInt(Constants.Product.Background))
    }
}
