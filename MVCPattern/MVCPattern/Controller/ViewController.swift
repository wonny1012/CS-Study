//
//  ViewController.swift
//  MVCPattern
//
//  Created by kwon ji won on 12/6/23.
//

import UIKit

class ViewController: UIViewController, UpdateUserInfoDelegate {
    
    @IBOutlet weak var userInfoView: UserInfoFlowView?
    @IBOutlet weak var resultView: ResultView?
    
    let userInfoModel = UserInforModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInfoView?.delegate = self
    }
    
    func updateUserInfo(firstName: String, lastName: String, age: String) {
        let fullName = self.userInfoModel.fullName(firstName: firstName, lastName: lastName)
        let yearString = self.userInfoModel.yearOfBirth(ageString: age)
        
        self.resultView?.updateResultView(name: fullName, year: yearString)
    }


}

