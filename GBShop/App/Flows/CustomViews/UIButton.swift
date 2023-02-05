//
//  UIButton.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

extension UIButton {
    
    func makeTapWithButtonShadow(_ button: UIButton) {
        button.addTarget(
            self,
            action: #selector(handleIn),
            for: [
                .touchDown,
                .touchDragInside
            ])
        button.addTarget(
            self,
            action: #selector(handleOut),
            for: [
                .touchUpInside,
                    .touchUpOutside,
                    .touchDragExit,
                    .touchCancel,
                    .touchDragOutside
            ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.1) {
            self.removeOpacity()
        }
    }
    @objc func handleOut() {
        UIView.animate(withDuration: 0.1) {
            self.setOpacity()
        }
    }
    
}
