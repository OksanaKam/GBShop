//
//  Resources.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit
enum Resources {
    enum Colors {
        static let red = UIColor.red
        static let black = UIColor.black
        static let white = UIColor.white
    }
    
    enum Fonts {
        
        static func helveticaRegular(with fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: fontSize) ?? UIFont()
        }
        static func helveticaBold(with fontSize: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica-Bold", size: fontSize) ?? UIFont()
        }
    }
    
    enum Strings {
        
        enum TabBarHeaders {
            static let catalog = "Каталог"
            static let basket = "Корзина"
            static let settings = "Настройки"
        }
        
        enum TabBarIconsNames {
            static let catalog = "list.bullet.rectangle"
            static let basket = "basket"
            static let settings = "gearshape.2"
        }
        
        enum ProductNames {
            static let macBook_Air_M2 = "Apple MacBook Air 13 M2"
            static let macBook_Air_M1 = "Apple MacBook Air M1"
            static let macBook_Pro_M2 = "Apple MacBook Pro 14 M2"
        }
        
        enum ProductPictures {
            static let macBook_Air_M2 = "MacBook"
            static let macBook_Air_M1 = "MacBook"
            static let macBook_Pro_M2 = "M2_Apple_MacBook_Pro"
            
        }
    }
    
}
