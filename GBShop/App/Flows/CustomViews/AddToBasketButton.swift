//
//  AddToBasketButton.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class AddToBasketButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension AddToBasketButton {
    func layoutViews() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func configure() {
        layer.cornerRadius = 5
        backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        setOpacity()
        makeTapWithButtonShadow(self)
    }
}
