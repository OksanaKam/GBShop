//
//  ProductReviewsCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductReviewsCell: BaseTableCell {
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let reviewLabel = UILabel()
    private let separator = UIView()
    
    init(name: String, date: String, review: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        nameLabel.text = name
        dateLabel.text = date
        reviewLabel.text = review
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductReviewsCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(nameLabel)
        mainCellView.addSubview(dateLabel)
        mainCellView.addSubview(reviewLabel)
        mainCellView.addSubview(separator)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            
            separator.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            separator.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            reviewLabel.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            reviewLabel.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            reviewLabel.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -10)
        ])
    }
    override func configure() {
        super.configure()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = .gray
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.numberOfLines = 0
        reviewLabel.lineBreakMode = .byWordWrapping
    }
}
