//
//  CategoryCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 25.01.2023.
//

import UIKit

protocol CategoryCollectionCellOutput: AnyObject {
    
    func categoryCollectionCellDidSelect(_ category: Category)
}

final class CategoryCollectionCell: UICollectionViewCell {
    
    var delegate: CategoryCollectionCellOutput?
    
    var category: Category?
    
    static let reuseId = "CategoryCell"
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(tapCategoryAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(categoryButton)
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(category: Category) {
        
        switch category.selected {
        case true:
            categoryButton.backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
            categoryButton.setTitleColor(.white, for: .normal)
        case false:
            categoryButton.backgroundColor = .clear
        }
        
        categoryButton.setTitle(category.name, for: .normal)
        self.category = category
    }
    
    @objc func tapCategoryAction() {
        if let category = category {
            
            category.selected = true
            
            delegate?.categoryCollectionCellDidSelect(category)
        }
    }
}
