//
//  ViewController.swift
//  AnimationBricqBrosPath
//
//  Created by Marin on 15/04/2018.
//  Copyright © 2018 Marin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animatedView = UIView(frame: CGRect(x: 34, y: 234.5, width: 50, height: 50))
    let secondAnimatedView = UIView(frame: CGRect(x: 34, y: 434.5, width: 50, height: 50))
    let thirdAnimatedView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(view.frame)
        
        // First rectangle animation ----
        animatedView.backgroundColor = UIColor.blue
        view.addSubview(animatedView)
        
        let bezierPath1 = UIBezierPath()
        bezierPath1.move(to: CGPoint(x: 34, y: 234.5))
        bezierPath1.addLine(to: CGPoint(x: 340, y: 234.5))
        bezierPath1.addLine(to: CGPoint(x: 340, y: 269.5))
        bezierPath1.addLine(to: CGPoint(x: 34, y: 269.5))
        bezierPath1.close()
        
        let pathAnimation1 = CAKeyframeAnimation(keyPath: "position")
        pathAnimation1.path = bezierPath1.cgPath
        pathAnimation1.calculationMode = kCAAnimationPaced
        pathAnimation1.duration = 5
        pathAnimation1.repeatCount = Float.infinity
        pathAnimation1.timingFunction = CAMediaTimingFunction(controlPoints: 0.69, 1.22, 0.83, -0.18)
        animatedView.layer.add(pathAnimation1, forKey: nil)
        
        firstLabel.text = "Timing Function : \(String(describing: pathAnimation1.timingFunction))"
        
        
        // Second rectangle animation ----
        secondAnimatedView.backgroundColor = UIColor.blue
        view.addSubview(secondAnimatedView)
        
        let bezierPath2 = UIBezierPath()
        bezierPath2.move(to: CGPoint(x: 34, y: 434.5))
        bezierPath2.addLine(to: CGPoint(x: 340, y: 434.5))
        bezierPath2.addLine(to: CGPoint(x: 340, y: 399.5))
        bezierPath2.addLine(to: CGPoint(x: 34, y: 399.5))
        bezierPath2.close()
        
        let pathAnimation2 = CAKeyframeAnimation(keyPath: "position")
        pathAnimation2.path = bezierPath2.cgPath
        pathAnimation2.calculationMode = kCAAnimationPaced
        pathAnimation2.duration = 5
        pathAnimation2.repeatCount = Float.infinity
        pathAnimation2.timingFunction = CAMediaTimingFunction(controlPoints: 0, 1.5, 1, 0)
        secondAnimatedView.layer.add(pathAnimation2, forKey: nil)
        
        secondLabel.text = "Timing Function : \(String(describing: pathAnimation2.timingFunction))"
        
        
        // Third rectangle animation ----
        thirdAnimatedView.backgroundColor = UIColor.red
        view.addSubview(thirdAnimatedView)
        
        let spiralePath = UIBezierPath()
        spiralePath.move(to: CGPoint(x: 170.07, y: 494.53))
        spiralePath.addCurve(to: CGPoint(x: 156.45, y: 506.16), controlPoint1: CGPoint(x: 176.71, y: 503.17), controlPoint2: CGPoint(x: 162.3, y: 508.22))
        spiralePath.addCurve(to: CGPoint(x: 148.02, y: 465.78), controlPoint1: CGPoint(x: 140.6, y: 500.55), controlPoint2: CGPoint(x: 140.19, y: 478.34))
        spiralePath.addCurve(to: CGPoint(x: 210.94, y: 459.63), controlPoint1: CGPoint(x: 162.04, y: 443.32), controlPoint2: CGPoint(x: 192.55, y: 443.9))
        spiralePath.addCurve(to: CGPoint(x: 214.17, y: 552.02), controlPoint1: CGPoint(x: 237.93, y: 482.72), controlPoint2: CGPoint(x: 236.32, y: 526.04))
        spiralePath.addCurve(to: CGPoint(x: 101.95, y: 552.68), controlPoint1: CGPoint(x: 184.65, y: 586.64), controlPoint2: CGPoint(x: 132.71, y: 583.76))
        spiralePath.addCurve(to: CGPoint(x: 103.92, y: 408.29), controlPoint1: CGPoint(x: 63.24, y: 513.57), controlPoint2: CGPoint(x: 67.12, y: 447.17))
        spiralePath.addCurve(to: CGPoint(x: 265.44, y: 413.11), controlPoint1: CGPoint(x: 148.5, y: 361.2), controlPoint2: CGPoint(x: 222.52, y: 366.51))
        spiralePath.addCurve(to: CGPoint(x: 258.27, y: 609.51), controlPoint1: CGPoint(x: 316.02, y: 468.03), controlPoint2: CGPoint(x: 309.83, y: 557.84))
        spiralePath.addCurve(to: CGPoint(x: 47.45, y: 599.2), controlPoint1: CGPoint(x: 198.75, y: 669.16), controlPoint2: CGPoint(x: 102.47, y: 661.39))
        spiralePath.addCurve(to: CGPoint(x: 59.82, y: 350.8), controlPoint1: CGPoint(x: -15.06, y: 528.54), controlPoint2: CGPoint(x: -6.52, y: 415.21))
        spiralePath.addCurve(to: CGPoint(x: 319.94, y: 366.59), controlPoint1: CGPoint(x: 134.25, y: 278.54), controlPoint2: CGPoint(x: 252.85, y: 288.79))
        spiralePath.addCurve(to: CGPoint(x: 302.37, y: 667), controlPoint1: CGPoint(x: 394.41, y: 452.96), controlPoint2: CGPoint(x: 383.52, y: 589.87))
        
        let spiralPathAnimation = CAKeyframeAnimation(keyPath: "position")
        spiralPathAnimation.path = spiralePath.cgPath
        spiralPathAnimation.calculationMode = kCAAnimationPaced
        
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 0.2
        scale.toValue = 1
        
        let rotate = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotate.values = [0.0, -.pi/2.0, 0.0, .pi/2.0, -Double.pi, 0.0]
        rotate.keyTimes = [0.0, 0.25, 0.4, 0.55, 0.80, 1.0]
        
        let redRectangleGroupAnimation = CAAnimationGroup()
        redRectangleGroupAnimation.animations = [spiralPathAnimation, scale, rotate]
        redRectangleGroupAnimation.duration = 5
        redRectangleGroupAnimation.repeatCount = Float.infinity
        redRectangleGroupAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.96, 0.59, 0.99)
        
        thirdAnimatedView.layer.add(redRectangleGroupAnimation, forKey: nil)
    }

}

