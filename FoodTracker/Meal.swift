//
//  Meal.swift
//  FoodTracker
//
//  Created by Nathan Wainwright on 2018-09-09.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
  
  //MARK: Properties
  
  //MARK: Archiving Paths
  
  static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
  
  
  //MARK: Types
  
//  calories: Int
//  description: String
  
  struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let rating = "rating"
    static let calories = "calories"
    static let mealDescription = "mealDescription"
  }
  
  var name: String
  var photo: UIImage?
  var rating: Int
  var calories: Int
  var mealDescription: String
  
  //MARK: Initializatio
  init?(name: String, photo: UIImage?, rating: Int, calories: Int, mealDescription: String) {
    
    // The name must not be empty
    guard !name.isEmpty else {
      return nil
    }
    
    // The rating must be between 0 and 5 inclusively
    guard (rating >= 0) && (rating <= 5) else {
      return nil
    }
    
    
    // Initialize stored properties.
    self.name = name
    self.photo = photo
    self.rating = rating
    self.calories = calories
    self.mealDescription = mealDescription
  }
  
  //MARK: NSCoding
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: PropertyKey.name)
    aCoder.encode(photo, forKey: PropertyKey.photo)
    aCoder.encode(rating, forKey: PropertyKey.rating)
    aCoder.encode(calories, forKey: PropertyKey.calories)
    aCoder.encode(mealDescription, forKey: PropertyKey.mealDescription)
    
  }
  required convenience init?(coder aDecoder: NSCoder) {
    
    // The name is required. If we cannot decode a name string, the initializer should fail.
    guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
      os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
      return nil
    }
    
    // Because photo is an optional property of Meal, just use conditional cast.
    let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
    
    let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
    
    // Must call designated initializer.
//    self.init(name: name, photo: photo, rating: rating)
    self.init(name: name, photo: photo, rating: rating, calories: calories, mealDescription: mealDescription)
    
  }
  
}




