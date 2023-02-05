//
//  OptionButtonsDelegate.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import Foundation

protocol OptionButtonsDelegate{
    func deleteButtonTapped(at index:IndexPath)
    func quantityButtonTapped(at index:IndexPath)
}
