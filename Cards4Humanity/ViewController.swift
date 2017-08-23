//
//  ViewController.swift
//  Cards4Humanity
//
//  Created by Giovanni Palusa on 2017-08-22.
//  Copyright © 2017 Giovanni Palusa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dealerBtn: UIButton!
    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var CPUScore: UILabel!
    @IBOutlet weak var howToPlayTitleLbl: UILabel!
    @IBOutlet weak var howToPlayInstrLbl: UILabel!
    
    
    // Initialize player class to local variable to save score
    var game = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Set score to 0
    var playerScoreNumber = 0
    var CPUScoreNumber = 0
    
    // Set array of cards names
    // ace is set to have the highest score (see how scores are set)
    let cardsArray = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    // When the deal button is pressed
    @IBAction func dealBtnPressed(_ sender: Any) {
        
        // If both scores are 0, start the timer
        // Else if the scores aren't 0, the game should be started and
        // then it's no need for a new timer
        if playerScoreNumber == 0 && CPUScoreNumber == 0 {
            self.timer()
        }
        
        howToPlayInstrLbl.isHidden = true
        howToPlayTitleLbl.isHidden = true
        
        // Grab random value for both CPU and Player
        // 13 cards, in the array ranging from 0-12
        let CPURandom = Int(arc4random_uniform(13))
        let playerRandom = Int(arc4random_uniform(13))
        
        // Grab the card name from the array, using the random number given
        let playerCard = cardsArray[playerRandom]
        let CPUCard = cardsArray[CPURandom]
        
        // Set the image to the name given from the array
        leftCard.image = UIImage(named: playerCard)
        rightCard.image = UIImage(named: CPUCard)
        
        // If player has the highest score or an ace, give player +1
        if playerRandom > CPURandom || playerRandom == 0 && CPURandom != 0 {
            playerScoreNumber += 1
        } else if playerRandom == CPURandom {
            //if a tie, do nothing
        } else {
            //give computer score
            CPUScoreNumber += 1
        }
        
        // Update scores label in game
        playerScore.text = ("\(playerScoreNumber)")
        CPUScore.text = ("\(CPUScoreNumber)")
    }
    
    // Timer function, set to 10 seconds, no need for repeat
    // When the timer has finished, run the finishedRound function
    func timer() {
        _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.finishedRound), userInfo: nil, repeats: false);
    }
    
    // Prepare for segue, sending the information needed to Player.swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let results = segue.destination as? finalScreenVC {
            results.game = game
        }
    }
    
    // Send the results to the object game, perform the segue and then automatically reset the game
    @objc func finishedRound() {
        
        // Store the results before reset
        game.CPUScore = CPUScoreNumber
        game.playerScore = playerScoreNumber
        
        // Send user to next view, using the segue endOfGame
        performSegue(withIdentifier: "endOfGame", sender: self)
        
        // Reset the game (score info has been stored in Player.swift
        playerScoreNumber = 0
        CPUScoreNumber = 0
        playerScore.text = ("\(playerScoreNumber)")
        CPUScore.text = ("\(CPUScoreNumber)")
        leftCard.image = UIImage(named: "back")
        rightCard.image = UIImage(named: "back")
        
    }
    
}










