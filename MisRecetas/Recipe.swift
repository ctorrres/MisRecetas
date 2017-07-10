//
//  Recipe.swift
//  MisRecetas
//
//  Created by Usuario on 08/06/17.
//  Copyright © 2017 Rafael Torres. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    var isFavourite : Bool = false
    
    
    init(name: String, imageName: String?, time: Int, ingredients: [String], steps: [String]){
    
        self.name = name
        self.image = UIImage(named: imageName!)
        self.time = time
        self.ingredients = ingredients
        self.steps = steps

    }
    
}
