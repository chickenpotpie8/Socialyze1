//
//  UIViewControllerExtension.swift
//  Slide
//
//  Created by bibek timalsina on 3/26/17.
//  Copyright © 2017 Salem Khan. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(message: String?, title: String? = "Error", okAction: (()->())? = nil ) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: "Ok", handler: okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWithOkCancel(message: String?, title: String? = "Error", okTitle: String? = "Ok", cancelTitle: String? = "Cancel", okAction: (()->())? = nil, cancelAction: (()->())? = nil) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: okTitle, handler: okAction)
        alertController.addAction(title: cancelTitle, style: .default, handler: cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func getAlert(message: String?, title: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func observe(selector: Selector, notification: GlobalConstants.Notification) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification.notification, object: nil)
    }
    
    func alert(message: GlobalConstants.Message) {
        if message.cancelTitle == nil {
            self.alert(message: message.message, title: message.title, okAction: message.okAction)
        }else {
            self.alertWithOkCancel(message: message.message, title: message.title, okTitle: message.okTitle, cancelTitle: message.cancelTitle, okAction: message.okAction, cancelAction: message.cancelAction)
        }
    }
    
    func alertLocationDenied() {
        self.alert(message: GlobalConstants.Message.locationDenied)
    }
}


extension UIAlertController {
    func addAction(title: String?, style: UIAlertActionStyle = .default, handler: (()->())? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: {_ in
            handler?()
        })
        self.addAction(action)
    }
}
