//
//  ClearBasketButton.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ClearBasketButton: UIButton {
    
    private let stackView = UIStackView()
    private let icon = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension ClearBasketButton {
    func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(label)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 33),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.borderColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        makeTapWithButtonShadow(self)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.isUserInteractionEnabled = false
        
        label.text = "Очистить"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        label.textAlignment = .left
        
        icon.image = UIImage(systemName: "basket")
        icon.tintColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
    }
    override func handleIn() {
        UIView.animate(withDuration: 0.2) {
            self.label.alpha = 0.55
            self.icon.alpha = 0.55
        }
    }
    override func handleOut() {
        UIView.animate(withDuration: 0.2) {
            self.label.alpha = 1
            self.icon.alpha = 1
        }
    }
}
