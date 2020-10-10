//
//  ViewController.swift
//  CardGame
//
//  Created by Enoch Qu　 on 10/9/20.
//  Copyright © 2020 Xin Enoch Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var P1Img1: UIImageView!
    
    @IBOutlet weak var P1Img2: UIImageView!
    
    @IBOutlet weak var P1Img3: UIImageView!
    
    @IBOutlet weak var P2Img1: UIImageView!
    
    @IBOutlet weak var P2Img2: UIImageView!
    
    @IBOutlet weak var P2Img3: UIImageView!

    @IBOutlet weak var lblWinner: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func btPlay(_ sender: UIButton) {
        let result = playGame();
        winner = result;
        if(result == "0") {
            lblWinner.text = "No Winner"
            playButton.setTitle("Continue Play", for: .normal)

        } else if( result == "1" ) {
            lblWinner.text = "Player 1 Win!"
            playButton.setTitle("Start a New Game", for: .normal)
            winGame()
        } else {
            lblWinner.text = "Player 2 Win!"
            playButton.setTitle("Start a New Game", for: .normal)
            winGame()
        }
    }
    
//    var p1Img1Value = -1
//    var p1Img2Value = -1
//    var p1Img3Value = -1
//    var p2Img1Value = -1
//    var p2Img2Value = -1
//    var p2Img3Value = -1
    var winner = "0"
    var values = [Int](repeating: 0, count: 6)
    let cards = ["AC","2C","3C","4C","5C","6C","7C","8C","9C","10C","JC","QC","KC","AD","2D","3D","4D","5D","6D","7D","8D","9D","10D","JD","QD","KD","AH","2H","3H","4H","5H","6H","7H","8H","9H","10H","JH","QH","KH","AS","2S","3S","4S","5S","6S","7S","8S","9S","10S","JS","QS","KS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWinner.text = "Who will win?"
        // Do any additional setup after loading the view.
    }
    
    func initGame() {
        lblWinner.text = "Who will win?"
        P1Img1.image = UIImage(named: "blue_back")
        P1Img2.image = UIImage(named: "purple_back")
        P1Img3.image = UIImage(named: "gray_back")
        P2Img1.image = UIImage(named: "green_back")
        P2Img2.image = UIImage(named: "yellow_back")
        P2Img3.image = UIImage(named: "red_back")
    }
    
    func winGame() {
        let alert = UIAlertController(title: "Player \(winner) Won!", message: "Do you want to start a new game?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
        self.initGame()}
        ))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil
            ))
        self.present(alert, animated: true)
    }
    
    func playGame() -> String {
        var set = Set<Int>()
        
        for index in 0...5 {
            values[index] = Int.random(in: 0..<52)
            while(set.contains(values[index])){
                values[index] = Int.random(in: 0..<52)
            }
            set.insert(values[index])
        }
        
        P1Img1.image = UIImage(named: cards[values[0]])
        P1Img2.image = UIImage(named: cards[values[1]])
        P1Img3.image = UIImage(named: cards[values[2]])
        P2Img1.image = UIImage(named: cards[values[3]])
        P2Img2.image = UIImage(named: cards[values[4]])
        P2Img3.image = UIImage(named: cards[values[5]])

        for index in 0...5 {
            if(values[index] == 39) {
                if(index < 3) {
                    return "1"
                } else if(index < 6) {
                    return "2"
                }
            }
        }
        


        return "0"
    }
    


}

