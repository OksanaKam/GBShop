//
//  ProductTagView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

class ProductTagView: UIView {
    
    private let label = UILabel()
    
    init(text: String, backgroundColor: UIColor, textColor: UIColor) {
        super.init(frame: CGRect())
        label.text = text
        label.textColor = textColor
        self.backgroundColor = backgroundColor
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ProductTagView {
    
    func addViews() {
        addSubview(label)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: 24),
            widthAnchor.constraint(equalToConstant: 134)
        ])
    }
    
    func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
    }
}
