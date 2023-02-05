//
//  BannerCollectionCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 25.01.2023.
//

import UIKit

final class BannerCollectionCell: UICollectionViewCell {
    
    static let reuseId = "BannerCollectionCell"
    
    private let bannerImageView: UIImageView = {
       let bannerImageView = UIImageView()
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.contentMode = .scaleToFill
        bannerImageView.layer.cornerRadius = 20
        return bannerImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerImageView.layer.shadowColor = UIColor.lightGray.cgColor
        bannerImageView.layer.shadowOpacity = 0.2
        bannerImageView.layer.shadowOffset = .zero
        bannerImageView.layer.shadowRadius = 10
    }
    
    func configure(_ model: UIImage) {
        bannerImageView.image = model
    }
}
