//
//  ViewController.swift
//  SwiftExample
//
//  Created by Nick Lockwood on 30/07/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//

import UIKit



class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate
{
    var items: [Int] = []
    
    @IBOutlet var container: UIView!
    @IBOutlet var carousel: iCarousel!
    
    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for i in 0...99
        {
            items.append(i)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let mainColor = pulseOrange
        let sdryColor = lighterOrange
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [sdryColor.CGColor, mainColor.CGColor]
        let gradientLocations: [Float] = [0.0,0.66]
        gradientLayer.locations = gradientLocations
        container.layer.insertSublayer(gradientLayer, atIndex: 0)
        carousel.type = .Wheel
        carousel.reloadData()
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var label: UILabel
        var itemView: UIImageView
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:300, height:250))
            itemView.image = UIImage(named: "page.png")
            itemView.layer.cornerRadius = 10
            itemView.contentMode = .Center
            itemView.clipsToBounds = true
            label = UILabel(frame:itemView.bounds)
            label.backgroundColor = whiteTrans
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(17)
            label.tag = 1
            itemView.addSubview(label)
        }
        else
        {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
            label = itemView.viewWithTag(1) as! UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value
        }
        else if (option == .Radius)
        {
            return value * 1.5
        }
        else if (option == .Wrap)
        {
            return 1.0
        }
        return value
    }
    
}

