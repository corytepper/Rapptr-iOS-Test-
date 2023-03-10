//
//  UIViewController+Ext.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 1/1/23.
//

import UIKit

extension UIViewController {
    
    func presentRapptrAlert(title: String, message: String, buttonTitle: String, popToRootVC: Bool) {
        DispatchQueue.main.async {
            let alertVC = Rapptr_AlertVC(title: title, message: message, buttonTitle: buttonTitle, popToRootVC: popToRootVC)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
            
            if popToRootVC {
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                return
            }
        }
    }
} 
