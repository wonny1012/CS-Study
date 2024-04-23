//
//  ResultView.swift
//  MVCPattern
//
//  Created by kwon ji won on 12/6/23.
//

import UIKit

class ResultView: UIView {
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var yearLabel: UILabel?
    
    func updateResultView(name: String, year: String){
        self.nameLabel?.text = name
        self.yearLabel?.text = year
    }
    
    
}
