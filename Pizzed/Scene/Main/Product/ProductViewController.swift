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

class ProductViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var disposeBag = DisposeBag()
    var viewModel: ProductViewModel!
    fileprivate var navigator: Application!
    
    private var source: ProductDataSource?
    
    static func viewController() -> ProductViewController? {
        return Helper.getViewController(named: "ProductViewController", inSb: "Main")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupUIs()
        bindUI()
    }

    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    static func createWith(navigator: Application, storyboard: UIStoryboard, viewModel: ProductViewModel) -> ProductViewController {
        let controller = storyboard.instantiateViewController(ofType: ProductViewController.self)
        controller.navigator = navigator
        controller.viewModel = viewModel
        return controller
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "TestCollectionViewCell", bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "TestCollectionViewCell")
    }
    
    private func configureCollectionView() {
        registerCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func bindUI() {
        
        viewModel.pizza
            .asObservable()
            .subscribe(onNext: { [weak self] (pizza) in
                self?.title = pizza.name
                print(pizza.name ?? "don't have any value")
            })
            .disposed(by: disposeBag)
        
        viewModel
            .pizzaDetailList
            .asObservable()
            .bind(to: productCollectionView.rx.items) { [weak self] collectionView, index, _ in
                let indexPath = IndexPath(item: index, section: 0)
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as? TestCollectionViewCell else {
                    fatalError("missing cell")
                }
                
                self?.config(cell, at: indexPath)
                return cell
            }
            .disposed(by: disposeBag)
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
        setupCollectionView()
        productCollectionView.backgroundColor = UIColor.FlatColor.mainBackground
        view.backgroundColor = UIColor.FlatColor.mainBackground
    }
    
    private func config(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? TestCollectionViewCell {
            cell.pizza = viewModel.pizzaDetailList.value[indexPath.row]
        }
    }
}
