//
//  UserViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import UIKit

protocol UserViewControllerInput {
    func showAlertController(with title: String, error: String)
}

final class UserViewController: UIViewController {
    
    private var userView: UserView {
        guard let view = self.view as? UserView else {
            let correctView = UserView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: UserViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UserView(frame: self.view.frame)
        userView.userViewController = self
        userView.creditCardTextField.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        userView.showUserInfo(userInfo: UserSession.instance.user)
    }
    
    func presentAlert(title: String, error: String) -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: error,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Close",style: .cancel)
        alertController.addAction(action)
        
        return alertController
    }
}

extension UserViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let boolForDelegate = presenter?.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
        else {
            return false
        }
        return boolForDelegate
    }
}

extension UserViewController: UserViewControllerInput {
    func showAlertController(with title: String, error: String) {
        DispatchQueue.main.async {
            self.present(self.presentAlert(title: title, error: error),
                         animated: true)
        }
    }
    
    
}
