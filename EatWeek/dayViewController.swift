//
//  dayViewController.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import UIKit
import os.log
import AVFoundation

class dayViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    let userDefault = UserDefaults.standard
    
    var days : Day!
    
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
    
    var breakArray = ["yogurt", "pancake", "fruit", "pastries", "oatmeal"]
    var lunchArray = ["salad","chicken","soup"]
    var dinnerArray = ["wings", "potato", "stew"]
    var snackArray = ["cherry", "mix", "nut", "cookie", "chipmix"]
    
    var breakNoRepeat = "waffle"
    var lunchNoRepeat = "sandwich"
    var dinnerNoRepeat = "lasagna"
    var snackNoRepeat = "chip"
    var breakingFast = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        breakfastImage.image = UIImage(named:"waffle")!
        lunchImage.image = UIImage(named:"sandwich")!
        dinnerImage.image = UIImage(named:"lasagna")!
        snacksImage.image = UIImage(named:"chip")!
        
      
    
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
        navigationItem.title = textField.text
    }

    private func updateSaveButtonState() {
        //let text = BreakfastText.text ?? ""
        
        if let text = BreakfastText.text, !text.isEmpty{
        
        saveButton.isEnabled = true
    }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let breakfast = BreakfastText.text ?? ""
        let lunch = LunchText.text ?? ""
        let dinner = DinnerText.text ?? ""
        let snack = SnackText.text ?? ""
        
        days = Day(breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)
    }


    func animationCount()
    {
       
        if breakCount <= 3{
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
                let random = Int(arc4random_uniform(5))
                let breakIm = breakArray[random]
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
            lunchAlpha = Double(round(100*self.lunchAlpha)/100)
            lunchImage.alpha = CGFloat(lunchAlpha)
                }
            else
                {
            lunchAlpha = lunchAlpha - 0.05
            lunchAlpha = Double(round(100*self.lunchAlpha)/100)
            lunchImage.alpha = CGFloat(lunchAlpha)
                }
            if lunchAlpha == 0.0
            {
                let random = Int(arc4random_uniform(3))
                let lunchIm = lunchArray[random]
                lunchArray.append("\(lunchNoRepeat)")
                lunchArray.remove(at: random)
                lunchNoRepeat = lunchIm
                lunchImage.image = UIImage(named:"\(lunchIm)")!
                print("\(lunchIm)")
                lunchBeta = true
            }
            if lunchAlpha == 1.0
            {
                lunchCount = 0
                lunchChange = false
                lunchBeta = false
            }
        }
        if dinnerChange == false
        {}
        else
        {
            if dinnerBeta == true
                {
            dinnerAlpha = dinnerAlpha + 0.05
            dinnerAlpha = Double(round(100*self.dinnerAlpha)/100)
            dinnerImage.alpha = CGFloat(dinnerAlpha)
                }
            else
                {
            dinnerAlpha = dinnerAlpha - 0.05
            dinnerAlpha = Double(round(100*self.dinnerAlpha)/100)
            dinnerImage.alpha = CGFloat(dinnerAlpha)
                }
            if dinnerAlpha == 0.0
            {
                let random = Int(arc4random_uniform(3))
                let dinnerIm = dinnerArray[random]
                dinnerArray.append("\(dinnerNoRepeat)")
                dinnerArray.remove(at: random)
                dinnerNoRepeat = dinnerIm
                dinnerImage.image = UIImage(named:"\(dinnerIm)")!
                print("\(dinnerIm)")
                dinnerBeta = true
            }
            if dinnerAlpha == 1.0
            {
                dinnerCount = 0
                dinnerChange = false
                dinnerBeta = false
            }
            
        }
        if snackChange == false
        {}
        else
        {
            if snackBeta == true
                {
            snackAlpha = snackAlpha + 0.05
            snackAlpha = Double(round(100*self.snackAlpha)/100)
            snacksImage.alpha = CGFloat(snackAlpha)
                }
            else
                {
            snackAlpha = snackAlpha - 0.05
            snackAlpha = Double(round(100*self.snackAlpha)/100)
            snacksImage.alpha = CGFloat(snackAlpha)
                }
            if snackAlpha == 0.0
            {
                let random = Int(arc4random_uniform(4))
                let snackIm = snackArray[random]
                snackArray.append("\(snackNoRepeat)")
                snackArray.remove(at: random)
                snackNoRepeat = snackIm
                snacksImage.image = UIImage(named:"\(snackIm)")!
                print("\(snackIm)")
                snackBeta = true
            }
            if snackAlpha == 1.0
            {
                snackCount = 0
                snackChange = false
                snackBeta = false
            }
        }
    }
   
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        days = Day(breakfast: BreakfastText.text!, lunch: LunchText.text!, dinner: DinnerText.text!, snack: SnackText.text!)
        
        
      
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

    
    



