//
//  ProductPictureCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductPictureCell: BaseTableCell {
    private let productPicture = UIImageView()
    
    init(picture: UIImage) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        productPicture.image = picture
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductPictureCell {
    override func addViews() {
        super.addViews()
        mainCellView.addSubview(productPicture)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            productPicture.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor),
            productPicture.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor),
            productPicture.topAnchor.constraint(equalTo: mainCellView.topAnchor),
            productPicture.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor),
        ])
    }
    override func configure() {
        super.configure()
        productPicture.translatesAutoresizingMaskIntoConstraints = false
        productPicture.contentMode = .scaleAspectFit
    }
}
