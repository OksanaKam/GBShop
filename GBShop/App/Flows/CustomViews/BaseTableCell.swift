//
//  BaseTableCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

class BaseTableCell: UITableViewCell {
    let mainCellView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseTableCell {
    func addViews() {
        addSubview(mainCellView)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            mainCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mainCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }
    func configure() {
        mainCellView.translatesAutoresizingMaskIntoConstraints = false
        mainCellView.layer.cornerRadius = 10
        mainCellView.backgroundColor = .white
        mainCellView.setOpacity()
    }
}
