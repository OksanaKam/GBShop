//
//  ProductDescriptionCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductDescriptionCell: BaseTableCell {
    private let nameTitle = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init(name: String, description: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        nameLabel.text = name
        descriptionLabel.text = description
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductDescriptionCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(nameTitle)
        mainCellView.addSubview(nameLabel)
        mainCellView.addSubview(descriptionLabel)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
                
            nameTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            nameTitle.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: nameTitle.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitle.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -10)
        ])
    }
    override func configure() {
        super.configure()
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.text = "Наименование: "
        nameTitle.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
}
