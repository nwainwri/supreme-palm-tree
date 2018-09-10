//
//  CloudTrackerManager.swift
//  FoodTracker
//
//  Created by Nathan Wainwright on 2018-09-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import Foundation

class CloudTrackerManager {
  //MARK: Properties
  let defaults = UserDefaults.standard
  
  // MARK: POST --  function.
  func postToCloudTracker(method: String, username: String, password: String) {
    
    // methods;
    // -- login -- text string, changes to login method
    // -- signup -- text string, changes to signup method
    
    let postData = [
      "username": username ,
      "password": password
    ]
    
    guard let postJSON = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
      print("could not serialize json")
      return
    }
    
    //    let url = URL(string: "https://cloud-tracker.herokuapp.com/signup")!
    let url = URL(string: "https://cloud-tracker.herokuapp.com/\(method)")!
    let request = NSMutableURLRequest(url: url)
    request.httpBody = postJSON
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
      
      guard let data = data else {
        print("no data returned from server \(String(describing: error?.localizedDescription))")
        return
      }
      
      guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> else {
        //         original code
        //        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,Dictionary<String,String>> else {
        print("data returned is not json, or not valid")
        return
      }
      
      guard let response = response as? HTTPURLResponse else {
        print("no response returned from server \(String(describing: error))")
        return
      }
      
      guard response.statusCode == 200 else {
        // handle error
        print("an error occurred \(String(describing: json["error"]))")
        return
      }
      // GRAB HERE
      
      if method == "signup" {
        self.defaults.set(json["id"], forKey: "user_id")
        self.defaults.set(json["token"], forKey: "user_token")
        self.defaults.set(json["username"], forKey: "Username")
        self.defaults.set(json["password"], forKey: "Password")
        
      }
      else if method == "login" {
        print("USER ID: \(String(describing: json["id"]))")
        print("USER: \(String(describing: json["username"]))")
        print("PASSWORD: \(String(describing: json["password"]))")
        print("TOKEN: \(String(describing: json["token"]))")
        
        
      } else {
        // nothing for now
      }
    }
    task.resume()
  }
  
  
  //  // MARK: SIGN UP --  function.
  //  func signUp(username: String, password: String) {
  //
  //    let postData = [
  //      "username": username ,
  //      "password": password
  //    ]
  //
  //    guard let postJSON = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
  //      print("could not serialize json")
  //      return
  //    }
  //
  //    let url = URL(string: "https://cloud-tracker.herokuapp.com/signup")!
  //    let request = NSMutableURLRequest(url: url)
  //    request.httpBody = postJSON
  //    request.httpMethod = "POST"
  //    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
  //    let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
  //
  //      guard let data = data else {
  //        print("no data returned from server \(String(describing: error?.localizedDescription))")
  //        return
  //      }
  //
  //      guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> else {
  //        //         original code
  //        //        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,Dictionary<String,String>> else {
  //        print("data returned is not json, or not valid")
  //        return
  //      }
  //
  //      guard let response = response as? HTTPURLResponse else {
  //        print("no response returned from server \(String(describing: error))")
  //        return
  //      }
  //
  //      guard response.statusCode == 200 else {
  //        // handle error
  //        print("an error occurred \(String(describing: json["error"]))")
  //        return
  //      }
  //      // GRAB HERE
  //      self.defaults.set(json["id"], forKey: "user_id")
  //      self.defaults.set(json["token"], forKey: "user_token")
  //      self.defaults.set(json["username"], forKey: "Username")
  //      self.defaults.set(json["password"], forKey: "Password")
  //    }
  //    task.resume()
  //  }
  
  
  //
  //
  //  // MARK: LOGIN --  function.
  //  func login(username: String, password: String) {
  //
  //    let postData = [
  //      "username": username ,
  //      "password": password
  //    ]
  //
  //    guard let postJSON = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
  //      print("could not serialize json")
  //      return
  //    }
  //
  //    let url = URL(string: "https://cloud-tracker.herokuapp.com/login")!
  //    let request = NSMutableURLRequest(url: url)
  //    request.httpBody = postJSON
  //    request.httpMethod = "POST"
  //    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
  //    let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
  //
  //      guard let data = data else {
  //        print("no data returned from server \(String(describing: error?.localizedDescription))")
  //        return
  //      }
  //
  //      guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> else {
  //        //         original code
  //        //        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,Dictionary<String,String>> else {
  //
  //        print("data returned is not json, or not valid")
  //        return
  //      }
  //
  //      guard let response = response as? HTTPURLResponse else {
  //        print("no response returned from server \(String(describing: error))")
  //        return
  //      }
  //
  //      guard response.statusCode == 200 else {
  //        // handle error
  //        print("an error occurred \(String(describing: json["error"]))")
  //        return
  //      }
  //      // GRAB HERE
  //      print("USER ID: \(String(describing: json["id"]))")
  //      print("USER: \(String(describing: json["username"]))")
  //      print("PASSWORD: \(String(describing: json["password"]))")
  //      print("TOKEN: \(String(describing: json["token"]))")
  //    }
  //    task.resume()
  //  }
  //
  //
}
