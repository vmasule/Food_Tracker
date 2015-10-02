//
//  Meal.swift
//  FoodTracker
//
//  Created by Bhaidas Masule on 28/09/2015.
//  Copyright © 2015 Mastek. All rights reserved.
//

import UIKit

class  Meal{
    
    //MARK: Properties
    
    var name: String
    
    var photo: UIImage?
    
    var rating: Int
    
    //MARK: Initializaltion
    
    init?(name: String, photo: UIImage?, rating: Int){
    
        self.name = name
        self.photo = photo
        self.rating = rating
    
        if name.isEmpty || rating < 0{
        
            return nil
        }
    }
    
    
}
