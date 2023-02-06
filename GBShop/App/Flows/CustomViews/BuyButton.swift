//
//  BuyButton.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class BuyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BuyButton {
    func layoutViews() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("К оплате", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 24)
        titleLabel?.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        titleLabel?.textAlignment = .center
        backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        layer.cornerRadius = 5
        setOpacity()
        makeTapWithButtonShadow(self)
    }
}
