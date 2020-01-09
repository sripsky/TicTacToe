//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sydney Ripsky on 11/18/19.
//  Copyright © 2019 Sydney Ripsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        if !gameOver{
            for label in labelsArray {
                if label.canTap {
                    if label.frame.contains(sender.location(in: backgroundView)) {
                        if xTurn {label.text = "X"
                        }
                        else {
                            label.text = "O"
                        }
                        xTurn = !xTurn
                        label.canTap = false
                        checkForWinner()
                    }
                }
            }
        }
    }
    
    func displayWinningMessage(message:String){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default){
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner(){
        if (gridLabel0.text == "X" && gridLabel1.text == "X" && gridLabel2.text == "X") || (gridLabel0.text == "O" && gridLabel1.text == "O" && gridLabel2.text == "O") {
                   displayWinningMessage(message: "\(gridLabel0.text!)'s Win")
               }
               if (gridLabel3.text == "X" && gridLabel4.text == "X" && gridLabel5.text == "X") || (gridLabel3.text == "O" && gridLabel4.text == "O" && gridLabel5.text == "O") {
                   displayWinningMessage(message: "\(gridLabel3.text!)'s Win")
               }
               if (gridLabel6.text == "X" && gridLabel7.text == "X" && gridLabel8.text == "X") || (gridLabel6.text == "O" && gridLabel7.text == "O" && gridLabel8.text == "O") {
                   displayWinningMessage(message: "\(gridLabel6.text!)'s Win")
               }
               if (gridLabel0.text == "X" && gridLabel3.text == "X" && gridLabel6.text == "X") || (gridLabel0.text == "O" && gridLabel3.text == "O" && gridLabel6.text == "O") {
                   displayWinningMessage(message: "\(gridLabel0.text!)'s Win")
               }
               if (gridLabel1.text == "X" && gridLabel4.text == "X" && gridLabel7.text == "X") || (gridLabel1.text == "O" && gridLabel4.text == "O" && gridLabel7.text == "O") {
                   displayWinningMessage(message: "\(gridLabel1.text!)'s Win")
               }
               if (gridLabel2.text == "X" && gridLabel5.text == "X" && gridLabel8.text == "X") || (gridLabel2.text == "O" && gridLabel5.text == "O" && gridLabel8.text == "O") {
                   displayWinningMessage(message: "\(gridLabel2.text!)'s Win")
               }
               if (gridLabel0.text == "X" && gridLabel4.text == "X" && gridLabel8.text == "X") || (gridLabel0.text == "O" && gridLabel4.text == "O" && gridLabel8.text == "O") {
                   displayWinningMessage(message: "\(gridLabel0.text!)'s Win")
               }
               if (gridLabel2.text == "X" && gridLabel4.text == "X" && gridLabel6.text == "X") || (gridLabel2.text == "O" && gridLabel4.text == "O" && gridLabel6.text == "O") {
                   displayWinningMessage(message: "\(gridLabel2.text!)'s Win")
               }
               else {
                   var counter = 0
                   for label in labelsArray{
                       if label.text == "X" || label.text == "O" {
                           counter += 1
                           
                       }
                   }
                   if counter == 9 {
                       displayWinningMessage(message: "Cat's Game")
            }
        }
    }
    
    func resetGame(){
        for label in labelsArray{
            label.text = ""
            label.canTap = true
            xTurn = true
            gameOver = false
        }
    }
}

