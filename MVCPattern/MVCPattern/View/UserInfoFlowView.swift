//
//  UserInfoFlow.swift
//  MVCPattern
//
//  Created by kwon ji won on 12/6/23.
//

import UIKit

protocol UpdateUserInfoDelegate: class {
    func updateUserInfo(firstName: String, lastName: String, age: String)
}

class UserInfoFlowView: UIView {
    @IBOutlet var firstNameTextField: UITextField?
    @IBOutlet var lastNameTextField: UITextField?
    @IBOutlet var ageTextField: UITextField?
    @IBOutlet var resultButton: UIButton?
    
    weak var delegate: UpdateUserInfoDelegate?
    
    @IBAction func didSelectResultButton(_ sender: Any) {
        guard let firstName = self.firstNameTextField?.text,
              let lastName = self.lastNameTextField?.text,
              let age = self.ageTextField?.text else {
            return
        }
        
        self.delegate?.updateUserInfo(firstName: firstName, lastName: lastName, age: age)
    }
    
}
