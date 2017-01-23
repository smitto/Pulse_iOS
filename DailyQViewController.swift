//
//  ViewController.swift
//  Pulse
//
//  Created by Ian Kumar Mukherjee on 2/29/16.
//  Copyright © 2016 Ian Kumar Mukherjee. All rights reserved.
//

import UIKit

var pulseOrange = UIColor(red: CGFloat(255/255.0),green: CGFloat(126/255.0),blue: CGFloat(59/255.0),alpha: CGFloat(1.0))
var lighterOrange = UIColor(red: CGFloat(255/255.0),green: CGFloat(181/255.0),blue: CGFloat(109/255.0),alpha: CGFloat(1.0))
var white = UIColor(red: CGFloat(255/255.0),green: CGFloat(255/255.0),blue: CGFloat(255/255.0),alpha: CGFloat(1.0))
var lightGray = UIColor(red: CGFloat(216/255.0),green: CGFloat(216/255.0),blue: CGFloat(216/255.0),alpha: CGFloat(1.0))
let whiteTrans = UIColor.colorWithAlphaComponent(white)(0.5) as! CGColor
let lgTrans = UIColor.colorWithAlphaComponent(lightGray)(0.5) as! CGColor
let backColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)

class DailyQViewController: UIViewController {
    
    @IBOutlet weak var DQLabel: UILabel!
    @IBOutlet var AnswerLater: UIButton!
    @IBOutlet weak var DQText: UITextField!
    @IBOutlet weak var RText: UITextField!
    let gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Text to white & remove background
        if RText != nil {
            RText.attributedPlaceholder = NSAttributedString(string:"Type Here.", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
            RText.backgroundColor = backColor
        }
        if DQText != nil {
            DQText.attributedPlaceholder = NSAttributedString(string:"Type Here.", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
            DQText.backgroundColor = backColor
        }
        //Gradient for background
        let mainColor = pulseOrange
        let sdryColor = lighterOrange
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [sdryColor.CGColor, mainColor.CGColor]
        let gradientLocations: [Float] = [0.0,0.66]
        gradientLayer.locations = gradientLocations
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController == nil ? UIStatusBarStyle.Default : UIStatusBarStyle.LightContent
    }
}

