//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    let image = "ic_logo"
    let logo = UIImageView()
    let fadeButton = RapptrButton()
    let partyButton = RapptrButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        
        setupNavBar(title: title ?? "")
        configureUIElements()
        layoutUIElements()
        
        let tapGR = UIPanGestureRecognizer(target: self, action: #selector(self.dragImg(_:)))
        logo.addGestureRecognizer(tapGR)
        logo.isUserInteractionEnabled = true
    }
    
    
    @objc func dragImg(_ sender:UIPanGestureRecognizer){
            let translation = sender.translation(in: self.view)
            logo.center = CGPoint(x: logo.center.x + translation.x, y: logo.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
    
    
    func configureUIElements() {
        
        view.backgroundColor = UIColor(named: "UIView_BG")
        view.addSubview(logo)
        view.addSubview(fadeButton)
        view.addSubview(partyButton)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: image)
        logo.isUserInteractionEnabled = true
        
        fadeButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "FADE IN")
        fadeButton.translatesAutoresizingMaskIntoConstraints = false
        fadeButton.addTarget(self, action: #selector(fadeButtonTapped), for: .touchUpInside)
        
        partyButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "PARTY")
        partyButton.translatesAutoresizingMaskIntoConstraints = false
        partyButton.addTarget(self, action: #selector(partyButtonTapped), for: .touchUpInside)
    }
    
    func layoutUIElements() {
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fadeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fadeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350).isActive  = true
        
        fadeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        fadeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        fadeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        partyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        partyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 271).isActive  = true
        
        partyButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        partyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        partyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    @objc func fadeButtonTapped() {
        let imageBool = logo.alpha == 0
        imageBool ? logo.fadeIn() : logo.fadeOut()
        imageBool ? fadeButton.setTitle("FADE OUT", for: .normal) : fadeButton.setTitle("FADE IN", for: .normal)
        
    }
    
    @objc func partyButtonTapped() {
        print( "party button tapped")
        
    }
}


public extension UIView {
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }

    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
}
