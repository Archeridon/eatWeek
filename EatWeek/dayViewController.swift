//
//  dayViewController.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import UIKit

class dayViewController: UIViewController {
    
    var days: Day?
    
 
    @IBOutlet weak var breakfastImage: UIImageView!
    @IBOutlet weak var lunchImage: UIImageView!
    @IBOutlet weak var dinnerImage: UIImageView!
    @IBOutlet weak var snacksImage: UIImageView!
    
    var animationTimer = Timer()
    var alphaTimer = Timer()
    
    var breakCount = 0
    var lunchCount = -2
    var dinnerCount = -4
    var snackCount = -6
    
    var breakChange = false
    var lunchChange = false
    var dinnerChange = false
    var snackChange = false
    
    var breakAlpha = 1.0
    var lunchAlpha = 1.0
    var dinnerAlpha = 1.0
    var snackAlpha = 1.0
    
    var breakBeta = false
    var lunchBeta = false
    var dinnerBeta = false
    var snackBeta = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    animationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animationCount), userInfo: nil, repeats: true)
    
    alphaTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(alphaAnimation), userInfo: nil, repeats: true)
    }
    

    func animationCount()
    {
       
        if breakCount <= 5{
        breakCount = breakCount + 1
        }
        else
        {
           breakChange = true
        }
        if lunchCount <= 5{
            lunchCount = lunchCount + 1
        }
        else
        {
            lunchChange = true
        }
        if dinnerCount <= 5{
            dinnerCount = dinnerCount + 1
        }
        else
        {
            dinnerChange = true
        }
        if snackCount <= 5{
            snackCount = snackCount + 1
        }
        else
        {
            snackChange = true
        }
        
    }
    
    func alphaAnimation()
    {
        if breakChange == false
        {}
        else
        {
            if breakBeta == true
                {
            breakAlpha = breakAlpha + 0.05
            breakfastImage.alpha = CGFloat(breakAlpha)
                }
            else
                {
            breakAlpha = breakAlpha - 0.05
            breakfastImage.alpha = CGFloat(breakAlpha)
                }
            if breakAlpha == 0.0
            {
                breakBeta = true
            }
        }
        if lunchChange == false
        {}
        else
        {
            if breakBeta == true
                {
            lunchAlpha = lunchAlpha + 0.05
            lunchImage.alpha = CGFloat(lunchAlpha)
                }
            else
                {
            lunchAlpha = lunchAlpha - 0.05
            lunchImage.alpha = CGFloat(lunchAlpha)
                }
            if lunchAlpha == 0.0
            {
                lunchBeta = true
            }
        }
        if dinnerChange == false
        {}
        else
        {
            if breakBeta == true
                {
            dinnerAlpha = dinnerAlpha + 0.05
            dinnerImage.alpha = CGFloat(dinnerAlpha)
                }
            else
                {
            dinnerAlpha = dinnerAlpha - 0.05
            dinnerImage.alpha = CGFloat(dinnerAlpha)
                }
            if dinnerAlpha == 0.0
            {
                dinnerBeta = true
            }
        }
        if snackChange == false
        {}
        else
        {
            if breakBeta == true
                {
            snackAlpha = snackAlpha + 0.05
            snacksImage.alpha = CGFloat(snackAlpha)
                }
            else
                {
            snackAlpha = snackAlpha - 0.05
            snacksImage.alpha = CGFloat(snackAlpha)
                }
            if snackAlpha == 0.0
            {
                snackBeta = true
            }
        }
    }

   

}
