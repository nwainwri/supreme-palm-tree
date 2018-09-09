//
//  ViewController.swift
//  FoodTracker
//
//  Created by Nathan Wainwright on 2018-09-08.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  //MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  
  @IBOutlet weak var mealNameLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    nameTextField.delegate = self
  
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    mealNameLabel.text = textField.text
  }
  
  
  
  //MARK: Actions
  @IBAction func setDefaultLabelText(_ sender: UIButton) {
    mealNameLabel.text = "Default Text"

  }
}

