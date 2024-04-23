//
//  UserInforModel.swift
//  MVCPattern
//
//  Created by kwon ji won on 12/6/23.
//

import Foundation

class UserInforModel {
    func fullName(firstName: String, lastName: String ) -> String {
        return "\(firstName) \(lastName)"
    }
    
    func yearOfBirth(ageString: String) -> String {
        let calender = Calendar.current
        let year = calender.component(.year , from: Date())
        
        let age = Int(ageString) ?? 0
        let birthyear = year - age
        
        return String(birthyear)
    }
}
