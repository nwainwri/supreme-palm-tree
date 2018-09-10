//
//  SignUpViewController.swift
//  FoodTracker
//
//  Created by Nathan Wainwright on 2018-09-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  let cloudTracker = CloudTrackerManager()
  
  // MARK: PROPERTIES
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  let defaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func signupButtonPressed(_ sender: UIButton) {
//    cloudTracker.signUp(username: usernameField.text!, password: passwordField.text!)
    cloudTracker.postToCloudTracker(method: "signup", username: usernameField.text!, password: passwordField.text!)
    self.performSegue(withIdentifier: "SignupLoginVC", sender: nil)
  }
  
  @IBAction func cancelButtonPressed(_ sender: UIButton) {
    usernameField.text = ""
    passwordField.text = ""
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
