//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
