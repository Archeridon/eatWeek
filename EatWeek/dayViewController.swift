//
//  dayViewController.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import UIKit

class dayViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var days: Day?
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var BreakfastText: UITextField!
    @IBOutlet weak var LunchText: UITextField!
    @IBOutlet weak var DinnerText: UITextField!
    @IBOutlet weak var SnackText: UITextField!
    
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
    
    var breakAlpha : Double = 1.0
    var lunchAlpha = 1.0
    var dinnerAlpha = 1.0
    var snackAlpha = 1.0
    
    var breakBeta = false
    var lunchBeta = false
    var dinnerBeta = false
    var snackBeta = false
    
    var breakArray = ["yogurt", "pancake", "fruit"]
    
    var breakNoRepeat = "waffle"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BreakfastText.delegate = self
        LunchText.delegate = self
        DinnerText.delegate = self
        SnackText.delegate = self
        
        if let days = days {
            BreakfastText.text = days.breakfast
            LunchText.text = days.lunch
            DinnerText.text = days.dinner
            SnackText.text = days.snack
        }
        updateSaveButtonState()
    

    
        
    animationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animationCount), userInfo: nil, repeats: true)
    
    alphaTimer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(alphaAnimation), userInfo: nil, repeats: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    private func updateSaveButtonState() {
        let text = BreakfastText.text ?? ""
        let texty = LunchText.text ?? ""
        let textyy = DinnerText.text ?? ""
        let textyyy = SnackText.text ?? ""
        saveButton.isEnabled = !text.isEmpty && !texty.isEmpty && !textyy.isEmpty && !textyyy.isEmpty
    }

    func animationCount()
    {
       
        if breakCount <= 1{
        breakCount = breakCount + 1
        }
        else
        {
           breakChange = true
        }
        if lunchCount <= 3{
            lunchCount = lunchCount + 1
        }
        else
        {
            lunchChange = true
        }
        if dinnerCount <= 3{
            dinnerCount = dinnerCount + 1
        }
        else
        {
            dinnerChange = true
        }
        if snackCount <= 3{
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
            breakAlpha = Double(round(100*self.breakAlpha)/100)
            breakfastImage.alpha = CGFloat(breakAlpha)
        
                }
            else
                {
            breakAlpha = breakAlpha - 0.05
            breakAlpha = Double(round(100*self.breakAlpha)/100)
            breakfastImage.alpha = CGFloat(breakAlpha)
            
                }
            if breakAlpha == 0.0
            {
                
                breakBeta = true
                var random = Int(arc4random_uniform(3))
                var breakIm = breakArray[random]
                breakArray.append("\(breakNoRepeat)")
                breakArray.remove(at: random)
                breakNoRepeat = breakIm
                breakfastImage.image = UIImage(named:"\(breakIm)")!
                print("\(breakIm)")
            }
            if breakAlpha == 1.0
            {
                breakCount = 0
                breakChange = false
                breakBeta = false
                
            }
        }
        if lunchChange == false
        {}
        else
        {
            if lunchBeta == true
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
            if lunchAlpha == 1.0
            {
                lunchCount = 0
                lunchChange = false
            }
        }
        if dinnerChange == false
        {}
        else
        {
            if dinnerBeta == true
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
            if dinnerAlpha == 1.0
            {
                dinnerCount = 0
                dinnerChange = false
            }
            
        }
        if snackChange == false
        {}
        else
        {
            if snackBeta == true
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
            if snackAlpha == 1.0
            {
                snackCount = 0
                snackChange = false
            }
        }
    }
   
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("Not in a nav controller")
        }
    }
    

    
    
    

}
