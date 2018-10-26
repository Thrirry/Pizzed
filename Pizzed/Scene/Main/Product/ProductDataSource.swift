//
//  ProductDataSource.swift
//  Pizzed
//
//  Created by Gone on 10/26/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ProductDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var viewModel: ProductViewModel!
    var products:  Variable<Array<Pizza>>
    
    private let bag = DisposeBag()
    private let collectionView: UICollectionView
    
    init(_ collectionView: UICollectionView, products: Variable<Array<Pizza>>) {
        self.collectionView = collectionView
        self.products       = products
        super.init()
    }
    
    func prepareSource() {
        collectionView.rx.setDelegate(self)
            .disposed(by: bag)
        
        products.asObservable()
            .bind(to: collectionView.rx.items) { (tableView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as? TestCollectionViewCell else {
                    fatalError()
                }
                
                cell.layer.borderWidth  = 1
                cell.layer.borderColor  = UIColor.white.cgColor
                cell.layer.cornerRadius = 5
                
//                cell.test.text = "\(row) :: \(element.product.id)"
                return cell
            }
            .disposed(by: bag)
    }
    
}

extension ProductDataSource {
    
    @objc(collectionView:layout:sizeForItemAtIndexPath:)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize              = UIScreen.main.bounds
        let screenWidth             = screenSize.width
        let cellSquareSize: CGFloat = (screenWidth / 2.0) - 10
        
        return CGSize.init(width: cellSquareSize, height: 240.0)
    }
    
    @objc(collectionView:layout:insetForSectionAtIndex:)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    @objc(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

