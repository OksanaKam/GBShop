//
//  BaseViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    let headerTitle = UILabel()
    private let leftHeaderButton = UIButton()
    private let rightHeaderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configure()
    }
    func setLeftHeaderButton(image: UIImage, selector: Selector) {
        headerView.addSubview(leftHeaderButton)
        leftHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        leftHeaderButton.tintColor = .black
        leftHeaderButton.layer.borderColor = UIColor.black.cgColor
        leftHeaderButton.layer.borderWidth = 3
        NSLayoutConstraint.activate([
            leftHeaderButton.centerYAnchor.constraint(equalTo: headerView.topAnchor, constant: 72),
            leftHeaderButton.centerXAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 35),
            leftHeaderButton.heightAnchor.constraint(equalToConstant: 30),
            leftHeaderButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        leftHeaderButton.setImage(image, for: .normal)
        leftHeaderButton.contentMode = .scaleAspectFill
        leftHeaderButton.addTarget(self, action: selector, for: .touchUpInside)
    }
    func setRightHeaderButton(image: UIImage, selector: Selector) {
        headerView.addSubview(rightHeaderButton)
        rightHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        rightHeaderButton.tintColor = .black
        leftHeaderButton.layer.borderColor = UIColor.black.cgColor
        leftHeaderButton.layer.borderWidth = 3
        NSLayoutConstraint.activate([
            rightHeaderButton.centerYAnchor.constraint(equalTo: headerView.topAnchor, constant: 72),
            rightHeaderButton.centerXAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -35),
            rightHeaderButton.heightAnchor.constraint(equalToConstant: 30),
            rightHeaderButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        rightHeaderButton.setImage(image, for: .normal)
        rightHeaderButton.contentMode = .scaleAspectFill
        rightHeaderButton.addTarget(self, action: selector, for: .touchUpInside)
    }
}

@objc extension BaseViewController {
    func addViews() {
        view.addSubview(headerView)
        headerView.addSubview(headerTitle)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: headerView.topAnchor, constant: 72),
            headerTitle.widthAnchor.constraint(equalToConstant: headerView.frame.width / 2)
        ])
    }
    func configure() {
        view.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        headerView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.font = UIFont.systemFont(ofSize: 24)
        headerTitle.textColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        headerTitle.textAlignment = .center
        headerTitle.numberOfLines = 1
        headerTitle.minimumScaleFactor = 0.5
        headerTitle.adjustsFontSizeToFitWidth = true
    }
}
