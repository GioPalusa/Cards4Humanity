//
//  finalScreenVC.swift
//  Cards4Humanity
//
//  Created by Giovanni Palusa on 2017-08-23.
//  Copyright © 2017 Giovanni Palusa. All rights reserved.
//

import UIKit

class finalScreenVC: UIViewController {
    
    // Fetch player from separate class
    var game: Player!
    
    @IBOutlet weak var playerScoreLbl: UILabel!
    @IBOutlet weak var CPUScoreLbl: UILabel!
    @IBOutlet weak var winOrLooseLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make local variables with player & CPU score
        let playerScore = game.playerScore
        let CPUScore = game.CPUScore
        
        // Set labels with the results from the game
        playerScoreLbl.text = "\(playerScore!)"
        CPUScoreLbl.text = "\(CPUScore!)"
        
        // set win / loose / tie text to label
        if playerScore! > CPUScore! {
            winOrLooseLbl.text = "Yay! You won with \(playerScore! - CPUScore!) points!"
        } else if playerScore! == CPUScore! {
            winOrLooseLbl.text = "So close! It was a tie!"
        } else {
            winOrLooseLbl.text = "Oh snap! You lost with \(CPUScore! - playerScore!) points."
        }
    }

    // When reset button is pressed. Dismiss the modal ViewController to go back to game
    @IBAction func resetGameBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
