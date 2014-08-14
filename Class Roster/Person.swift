//
//  Person.swift
//  Class Roster Part 2
//
//  Created by Kevin Pham on 8/12/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var firstName : String
    var lastName : String
    var profileImage : UIImage?
    
    init (firstName : String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
}