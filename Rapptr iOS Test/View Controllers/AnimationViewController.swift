//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.


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
 *    section in Swift to show off your skills. Anything your heart desires!
 *
 */


import UIKit
import CoreMotion

final class AnimationViewController: UIViewController {
    private let image = "ic_logo"
    private let logo = UIImageView()
    private let fadeButton = RapptrButton()
    private let gravityButton = RapptrButton()
    private var gravityBool = false
    
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var motion: CMMotionManager!
    
    private var queue: OperationQueue!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        
        setupNavBar(title: title ?? "")
        configureUIElements()
        layoutUIElements()
    }
    
    
    // MARK: - Interactions
    @objc private func dragImage(_ sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: self.view)
        logo.center = CGPoint(x: logo.center.x + translation.x, y: logo.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    @objc private func fadeButtonTapped() {
        let imageBool = logo.alpha == 0
        imageBool ? logo.fadeIn() : logo.fadeOut()
        imageBool ? fadeButton.setTitle("FADE OUT", for: .normal) : fadeButton.setTitle("FADE IN", for: .normal)
    }
    
    
    @objc private func gravityButtonTapped() {
        gravityBool ?  removeGravity() : addGravity()
        gravityBool ? gravityButton.setTitle("RESET", for: .normal) : gravityButton.setTitle("GRAVITY", for: .normal)
    }
    
    
    // MARK: - Gravity Methods
    private func addGravity() {
        gravityBool = true
        queue = OperationQueue.current
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [logo, fadeButton, gravityButton])
        motion = CMMotionManager()
        
        let collision = UICollisionBehavior(items: [logo, fadeButton, gravityButton])
        collision.addBoundary(withIdentifier: "borders" as NSCopying, for: UIBezierPath(rect: self.view.frame))
        
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        motion.startDeviceMotionUpdates(to: queue, withHandler: motionHandler)
    }
    
    private func removeGravity() {
        gravityBool = false
        animator.removeAllBehaviors()
        motion.stopDeviceMotionUpdates()
        viewDidLoad()
    }
    
    
    // MARK: - Setup
    private func configureUIElements() {
        view.backgroundColor = UIColor(named: "UIView_BG")
        view.addSubview(logo)
        view.addSubview(fadeButton)
        view.addSubview(gravityButton)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: image)
        logo.isUserInteractionEnabled = true
        
        fadeButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "FADE IN")
        fadeButton.translatesAutoresizingMaskIntoConstraints = false
        fadeButton.addTarget(self, action: #selector(fadeButtonTapped), for: .touchUpInside)
        
        gravityButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "GRAVITY")
        gravityButton.translatesAutoresizingMaskIntoConstraints = false
        gravityButton.addTarget(self, action: #selector(gravityButtonTapped), for: .touchUpInside)
        
        let tapGR = UIPanGestureRecognizer(target: self, action: #selector(self.dragImage(_:)))
        logo.addGestureRecognizer(tapGR)
        logo.isUserInteractionEnabled = true
    }
    
    
    private func layoutUIElements() {
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fadeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fadeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350).isActive  = true
        
        fadeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        fadeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        fadeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        gravityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gravityButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 271).isActive  = true
        
        gravityButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        gravityButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        gravityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
}


private extension UIView {
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

private extension AnimationViewController {
    
    private func motionHandler( motion: CMDeviceMotion?, error: Error? ) {
        guard let motion = motion else { return }
        
        let grav: CMAcceleration = motion.gravity
        let x = CGFloat(grav.x)
        let y = CGFloat(grav.y)
        var p = CGPoint(x: x, y: y)
        
        if let orientation = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.interfaceOrientation {
            if orientation == .landscapeLeft {
                let t = p.x
                p.x = 0 - p.y
                p.y = t
            } else if orientation == .landscapeRight {
                let t = p.x
                p.x = p.y
                p.y = 0 - t
            } else if orientation == .portraitUpsideDown {
                p.x *= -1
                p.y *= -1
            }
        }
        
        let v = CGVector(dx: p.x, dy: 0 - p.y)
        self.gravity.gravityDirection = v
    }
}
