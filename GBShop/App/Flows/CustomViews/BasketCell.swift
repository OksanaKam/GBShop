//
//  BasketCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

final class BasketCell: BaseTableCell {
    var delegate: OptionButtonsDelegate?
    var indexPath: IndexPath?
    
    private var price: Double = 0
    private let image = UIImageView(frame: CGRect(x: 10, y: 10, width: 105, height: 105))
    private let productNameTitle = UILabel()
    private let priceTitle = UILabel()
    private let deleteButton = DeleteButton()
    private let quantityButton = QuantityButton()
    
    init(name: String, image: UIImage, quantity: Int, price: Double) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        productNameTitle.text = name
        self.image.image = image
        quantityButton.setLabel(text: "\(quantity)")
        priceTitle.text = "\(price) ₽"
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BasketCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(image)
        mainCellView.addSubview(productNameTitle)
        mainCellView.addSubview(priceTitle)
        mainCellView.addSubview(deleteButton)
        mainCellView.addSubview(quantityButton)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            productNameTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            productNameTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            
            priceTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            priceTitle.topAnchor.constraint(equalTo: productNameTitle.bottomAnchor),
            
            deleteButton.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            deleteButton.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -10),
            
            quantityButton.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            quantityButton.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -10),
            quantityButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
            quantityButton.leadingAnchor.constraint(equalTo: deleteButton.trailingAnchor, constant: 10)
        ])
    }
    override func configure() {
        super.configure()
        contentView.isUserInteractionEnabled = false
        
        productNameTitle.translatesAutoresizingMaskIntoConstraints = false
        productNameTitle.font = UIFont.systemFont(ofSize: 16)
        productNameTitle.textAlignment = .left
        productNameTitle.adjustsFontSizeToFitWidth = true
        productNameTitle.minimumScaleFactor = 0.5

        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        priceTitle.font = UIFont.systemFont(ofSize: 16)
        priceTitle.textAlignment = .left
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        
        quantityButton.translatesAutoresizingMaskIntoConstraints = false
        quantityButton.addTarget(self, action: #selector(quantityButtonPressed), for: .touchUpInside)
    }
    func deleteButtonPressed() {
        if let indexPath = indexPath {
            self.delegate?.deleteButtonTapped(at: indexPath)
        }
    }
    func quantityButtonPressed() {
        if let indexPath = indexPath {
            self.delegate?.quantityButtonTapped(at: indexPath)
        }
    }
}
