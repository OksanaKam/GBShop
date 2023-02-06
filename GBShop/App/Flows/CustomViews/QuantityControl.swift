//
//  QuantityControl.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

class QuantityControl: UIView {
    private var quantity = 1
    private let label = UILabel()
    private let decreaseButton = UIButton()
    private let increaseButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getQuantity() -> Int {
        return quantity
    }
}

@objc extension QuantityControl {
    func addViews() {
        addSubview(label)
        addSubview(decreaseButton)
        addSubview(increaseButton)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            decreaseButton.heightAnchor.constraint(equalToConstant: 40),
            decreaseButton.widthAnchor.constraint(equalToConstant: 40),
            decreaseButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            increaseButton.heightAnchor.constraint(equalToConstant: 40),
            increaseButton.widthAnchor.constraint(equalToConstant: 40),
            increaseButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.cornerRadius = 5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(quantity)"
        
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.setTitle("-", for: .normal)
        decreaseButton.backgroundColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        decreaseButton.layer.cornerRadius = 5
        decreaseButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        decreaseButton.setOpacity()
        decreaseButton.makeTapWithButtonShadow(decreaseButton)
        
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.setTitle("+", for: .normal)
        increaseButton.backgroundColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        increaseButton.layer.cornerRadius = 5
        increaseButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        increaseButton.setOpacity()
        increaseButton.makeTapWithButtonShadow(increaseButton)
    }
    func decreaseQuantity() {
        if quantity > 1 {
            quantity -= 1
        }
        label.text = "\(quantity)"
    }
    func increaseQuantity() {
        quantity += 1
        label.text = "\(quantity)"
    }
}
