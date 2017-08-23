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
    @IBOutlet weak var winOrLooseLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerScore = game.playerScore
        let CPUScore = game.CPUScore
        playerScoreLbl.text = "\(playerScore!)"
        CPUScoreLbl.text = "\(CPUScore!)"
        
        if playerScore! > CPUScore! {
            winOrLooseLbl.text = "Yay! You won!"
        } else if playerScore! == CPUScore! {
            winOrLooseLbl.text = "So close! It was a tie!"
        } else {
            winOrLooseLbl.text = "Oh snap! You lost"
        }
        
    }

    // When reset button is pressed. Dismiss the modal ViewController to go back to game
    @IBAction func resetGameBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
