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
var white = UIColor(red: CGFloat(255/255.0),green: CGFloat(255.0/255.0),blue: CGFloat(255.0/255.0),alpha: CGFloat(1.0))
var black = UIColor(red: CGFloat(0/255.0),green: CGFloat(0/255.0),blue: CGFloat(0/255.0),alpha: CGFloat(1.0))
var lightGray = UIColor(red: CGFloat(216/255.0),green: CGFloat(216/255.0),blue: CGFloat(216/255.0),alpha: CGFloat(1.0))
let whiteTrans = UIColor.colorWithAlphaComponent(white)(0.8)
let lgTrans = UIColor.colorWithAlphaComponent(lightGray)(0.8)
let backColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)

class DailyQViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var DQLabel: UILabel!
    @IBOutlet var AnswerLater: UIButton!
    @IBOutlet weak var DQText: UITextView!
    @IBOutlet weak var RText: UITextView!
    let gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Text to white & remove background
        if RText != nil {
            RText.delegate = self
            RText.textColor = whiteTrans
            RText.text = "Type Here."
            RText.backgroundColor = backColor
        }
        if DQText != nil {
            DQText.delegate = self
            DQText.textColor = whiteTrans
            DQText.text = "Type Here."
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

    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == whiteTrans {
            textView.text = nil
            textView.textColor = white
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = whiteTrans
            textView.text = "Type Here."
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController == nil ? UIStatusBarStyle.Default : UIStatusBarStyle.LightContent
    }
}

