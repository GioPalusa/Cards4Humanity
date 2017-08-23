//
//  ResultsView.swift
//  Cards4Humanity
//
//  Created by Giovanni Palusa on 2017-08-22.
//  Copyright © 2017 Giovanni Palusa. All rights reserved.
//

import UIKit

class ResultsView: UIViewController {
    
        
    var CPUScore: Int! = 0
    var playerScore: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLbl.text = ("\(playerScore)")
    }
    
    

    

    @IBAction func resetBtnWasPressed(_ sender: Any) {
    }
    
    
}
