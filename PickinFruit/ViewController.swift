//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    // var components: [Int] = [0,1,2]
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.dataSource = self
        self.fruitPicker.delegate = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 0, animated: true)
        
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 1, animated: true)
        
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 2, animated: true)
        
        let column1 = self.fruitPicker.selectedRowInComponent(0)
        let column2 = self.fruitPicker.selectedRowInComponent(1)
        let column3 = self.fruitPicker.selectedRowInComponent(2)
        
        
        
        if column1 == column2 && column2 == column3 && column1 == column3 {
            resultLabel.text = "WINNER!"
            resultLabel.hidden = false
            self.blinkLabel()
            print("i'm winning")
        } else {
            
            resultLabel.text = "TRY AGAIN"
            resultLabel.hidden = false
            self.blinkLabel()
            print("i need to try again")
        }
    }
    
    
    func blinkLabel(){
        
        UIView.animateWithDuration(0.3, delay: 0, options: [.Repeat, .Autoreverse], animations: {
            UIView.setAnimationRepeatCount(3.0)
            self.resultLabel.hidden = true
            self.resultLabel.hidden = false
            self.view.layoutIfNeeded()
        }) { (isFinished) in
            if isFinished == true {
                
                self.resultLabel.hidden = true
                
                //check status before setting label to hidden true
            }
        }
    
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1000
        
        //return self.fruitsArray.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //        return self.fruitsArray[row]
        return self.fruitsArray[row % self.fruitsArray.count]
        //return fruitsArrray[row % fruitsArray.count] allows us to never exceed the amount of objects in the array, always keeps the index of number of objects in the array
        
    }
    
    
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



