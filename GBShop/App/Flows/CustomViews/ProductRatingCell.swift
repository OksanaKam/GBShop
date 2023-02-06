//
//  ProductRatingCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductRatingCell: BaseTableCell {
    private let ratingTitle = UILabel()
    private let reviewsTitle = UILabel()
    private let reviewsLabel = UILabel()
    private let starsStackView = UIStackView()
    
    init(rating: Int, reviews: Int) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        var index = 0
        while index < rating {
            starsStackView.addArrangedSubview(UIImageView(image: UIImage(named: "star_active")))
            index += 1
        }
        while index < 5 {
            starsStackView.addArrangedSubview(UIImageView(image: UIImage(named: "star_inactive")))
            index += 1
        }
        reviewsLabel.text = "\(reviews)"
        
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductRatingCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(ratingTitle)
        mainCellView.addSubview(reviewsTitle)
        mainCellView.addSubview(reviewsLabel)
        mainCellView.addSubview(starsStackView)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            ratingTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            ratingTitle.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            
            reviewsTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            reviewsTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            
            reviewsLabel.topAnchor.constraint(equalTo: reviewsTitle.bottomAnchor),
            reviewsLabel.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            
            starsStackView.topAnchor.constraint(equalTo: ratingTitle.bottomAnchor),
            starsStackView.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            
        ])
    }
    override func configure() {
        super.configure()
        ratingTitle.translatesAutoresizingMaskIntoConstraints = false
        ratingTitle.text = "Рейтинг покупателей:"
        
        reviewsTitle.translatesAutoresizingMaskIntoConstraints = false
        reviewsTitle.text = "Отзывов:"
        
        reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewsLabel.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        reviewsLabel.font = Resources.Fonts.helveticaRegular(with: 24)
        
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        starsStackView.axis = .horizontal
        starsStackView.distribution = .fill
        starsStackView.alignment = .leading
        starsStackView.spacing = 5
    }
}
