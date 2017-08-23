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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var playerScoreNumber = 0
    var CPUScoreNumber = 0
    
    
    @IBAction func dealBtnPressed(_ sender: Any) {
        let cardsArray = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
        
        if playerScoreNumber == 0 && CPUScoreNumber == 0 {
            self.timer()
        }
        
        let CPURandom = Int(arc4random_uniform(13))
        let playerRandom = Int(arc4random_uniform(13))
        
        let playerCard = cardsArray[playerRandom]
        let CPUCard = cardsArray[CPURandom]
        
        leftCard.image = UIImage(named: playerCard)
        rightCard.image = UIImage(named: CPUCard)
        
        if playerRandom > CPURandom || playerRandom == 0 && CPURandom != 0 {
            playerScoreNumber += 1
        } else if playerRandom == CPURandom {
            //do something
        } else {
            CPUScoreNumber += 1
        }
        
        playerScore.text = ("\(playerScoreNumber)")
        CPUScore.text = ("\(CPUScoreNumber)")
    }
    
    func timer() {
        _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.finishedRound), userInfo: nil, repeats: false);
    }
    
    @objc func finishedRound() {
        print("TIMER FINISHED")
        playerScoreNumber = 0
        CPUScoreNumber = 0
        playerScore.text = ("\(playerScoreNumber)")
        CPUScore.text = ("\(CPUScoreNumber)")
        performSegue(withIdentifier: "endOfGame", sender: self)
    }
    
}










