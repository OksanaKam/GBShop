//
//  CategoryHeaderView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 25.01.2023.
//

import UIKit

class CategoryHeaderView: UIView {
    
    var categories: [Category] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var delegateCell: CategoryCollectionCellOutput?
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: LayoutCategoryCollection.categoryWidth, height: LayoutCategoryCollection.categoryHeight)
        layout.minimumInteritemSpacing = LayoutCategoryCollection.offset
        layout.minimumLineSpacing = LayoutCategoryCollection.offset
        layout.sectionInset = UIEdgeInsets(top: LayoutCategoryCollection.offset, left: LayoutCategoryCollection.offset, bottom: LayoutCategoryCollection.offset, right: LayoutCategoryCollection.offset)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
    }
    
    func update(_ categories: [Category]) {
        self.categories = categories
    }
}

extension CategoryHeaderView {
    private struct LayoutCategoryCollection {
        static let offset: CGFloat = 5
        static let categoryWidth: CGFloat = 120
        static let categoryHeight: CGFloat = 40
        static let containerHeight = categoryHeight + offset * 2
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension CategoryHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.reuseId, for: indexPath) as? CategoryCollectionCell
        else { return UICollectionViewCell() }
        let category = categories[indexPath.item]
        cell.configure(category: category)
        cell.delegate = delegateCell
        return cell
    }
}
