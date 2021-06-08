//
//  UIAlertController+Extension.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 07.06.2021.
//

import UIKit

extension UIAlertController {
    static func errorAlert(_ message: String? = "Please, try later",
                           actions: [UIAlertAction]? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }

        return alert
    }
}
