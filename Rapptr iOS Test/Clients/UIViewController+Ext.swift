//
//  UIViewController+Ext.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 1/1/23.
//

import UIKit

extension UIViewController {
    
    func presentRapptrAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = Rapptr_AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func presentDefaultError() {
        let alertVC = Rapptr_AlertVC(title: "Something went wrong",
                                     message: "We were unable to complete your task at this time. Please try again.",
                                     buttonTitle: "Ok")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}
