//
//  finalScreenVC.swift
//  Cards4Humanity
//
//  Created by Giovanni Palusa on 2017-08-23.
//  Copyright © 2017 Giovanni Palusa. All rights reserved.
//

import UIKit

class finalScreenVC: UIViewController {
    
    var game: Player!
    
    @IBOutlet weak var playerScoreLbl: UILabel!
    @IBOutlet weak var CPUScoreLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let playerScore = game.playerScore
        let CPUScore = game.CPUScore
        playerScoreLbl.text = "\(playerScore!)"
        CPUScoreLbl.text = "\(CPUScore!)"
        
        print("TIMER FINISHED. Player has \(playerScore!) & CPU has \(CPUScore!)")
    }

    

}
