//
//  BannerCell.swift
//  GBShop
//
//  Created by Оксана Каменчук on 25.01.2023.
//

import UIKit

final class BannerCell: UITableViewCell {
    
    var banners = [UIImage(named: "banner1"), UIImage(named: "banner2")]
    
    static let reuseID = "BannerCell"
    
    lazy var bannerCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Layout.bannerWidth, height: Layout.bannerHeight)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        let bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        bannerCollectionView.showsHorizontalScrollIndicator = false
        bannerCollectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.reuseId)
        
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        bannerCollectionView.dataSource = self
        
        return bannerCollectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(bannerCollectionView)
        
        NSLayoutConstraint.activate([
            bannerCollectionView.heightAnchor.constraint(equalToConstant: Layout.containerHeight),
            bannerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension BannerCell {
    struct Layout {
        static let bannerWidth: CGFloat = 200
        static let bannerHeight: CGFloat = 90
        static let containerHeight = bannerHeight + 10
    }
}

extension BannerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reuseId, for: indexPath) as? BannerCollectionCell,
            let currentBanner = banners[indexPath.item]
        else { return UICollectionViewCell() }
        cell.configure(currentBanner)
        return cell
    }
}
