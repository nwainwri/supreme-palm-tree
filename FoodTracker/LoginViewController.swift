//
//  LoginViewController.swift
//  FoodTracker
//
//  Created by Nathan Wainwright on 2018-09-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
  
  //MARK: TESTING
  
//CURRENT
//  USERNAME: Optional("new1277")
//  PASSWORD: Optional("nw12")
//  ID: Optional("398")
//  TOKEN: Optional("XcQrUYwC74oma1VhzgDxjdtb")
  
  
//OLD ONE
//  USERNAME: Optional("new12345")
//  PASSWORD: Optional("nw12")
//  ID: Optional("390")
//  TOKEN: Optional("mAMQTrfoTP7F9qwYfXv3N6ZG")
  
  
  
  // MARK: Properties
  
  @IBOutlet weak var userNameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  let defaults = UserDefaults.standard
  let cloudTracker = CloudTrackerManager()
  
  // THIS IS WHERE WE'D CHECK PASSWORD AND USERNAME
  // NOW WE'LL JUST SAVE IT INTO USER DEFAULT.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func loginButtonPressed(_ sender: UIButton) {
    if userNameField.text == defaults.string(forKey: "Username") && passwordField.text == defaults.string(forKey: "Password") {
//      cloudTracker.login(username: userNameField.text!, password: passwordField.text!)
      cloudTracker.postToCloudTracker(method: "login", username: userNameField.text!, password: passwordField.text!)
      self.performSegue(withIdentifier: "NavigationLoginVC", sender: nil)
    } else {
      print("USER OR PASS WRONG")
    }
  }
  
  @IBAction func cancelButtonPressed(_ sender: UIButton) {
    userNameField.text = ""
    passwordField.text = ""
    
    // debug statements
    print("USERNAME: \(String(describing: defaults.string(forKey: "Username")))")
    print("PASSWORD: \(String(describing: defaults.string(forKey: "Password")))")
    print("ID: \(String(describing: defaults.string(forKey: "user_id")))")
    print("TOKEN: \(String(describing: defaults.string(forKey: "user_token")))")
    
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
