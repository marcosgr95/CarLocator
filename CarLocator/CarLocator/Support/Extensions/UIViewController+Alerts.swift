//
//  UIViewController+Alerts.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import UIKit

extension UIViewController {

    public func showAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self?.present(alertViewController, animated: true, completion: nil)
        }
    }

}
