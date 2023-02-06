//
//  ProductPriceCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductPriceCell: BaseTableCell {
    private let priceHeaderLabel = UILabel()
    private let priceLabel = UILabel()
    private let tagsStackView = UIStackView()
    private let hasView = ProductTagView(
        text: "В наличии",
        backgroundColor: .green,
        textColor: Resources.Colors.black)
    private let newView = ProductTagView(
        text: "Новинка",
        backgroundColor: Resources.Colors.red,
        textColor: Resources.Colors.white)
    
    init(price: Int) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        priceLabel.text = "\(price) ₽"
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductPriceCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(priceHeaderLabel)
        mainCellView.addSubview(priceLabel)
        mainCellView.addSubview(tagsStackView)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            priceHeaderLabel.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            priceHeaderLabel.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            
            priceLabel.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: priceHeaderLabel.bottomAnchor, constant: 0),
            
            tagsStackView.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            tagsStackView.centerYAnchor.constraint(equalTo: mainCellView.centerYAnchor)
        ])
    }
    override func configure() {
        super.configure()
        priceHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        priceHeaderLabel.font = Resources.Fonts.helveticaRegular(with: 16)
        priceHeaderLabel.text = "Цена:"
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = Resources.Fonts.helveticaBold(with: 30)
        priceLabel.textColor = Resources.Colors.red
        
        tagsStackView.translatesAutoresizingMaskIntoConstraints = false
        tagsStackView.axis = .vertical
        tagsStackView.distribution = .fill
        tagsStackView.alignment = .trailing
        tagsStackView.spacing = 5
        tagsStackView.addArrangedSubview(newView)
        tagsStackView.addArrangedSubview(hasView)
    }
}
