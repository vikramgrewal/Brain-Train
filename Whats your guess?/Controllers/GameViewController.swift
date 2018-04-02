//
//  GameViewController.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/25/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

   var game : Game!

   @IBOutlet weak var stackOne: UIStackView!, stackTwo: UIStackView!,
   stackThree: UIStackView!, stackFour: UIStackView!

   var stacksArray : [UIStackView]!, gameCardViews : [UIView]!, flippedIndices : [Int]!
   
   override func viewDidLoad() {

      super.viewDidLoad()

      setNeedsStatusBarAppearanceUpdate()

      game = Game()

      setGameCards()

      addListeners()

      // Do any additional setup after loading the view, typically from a nib.

   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
   }

   func setGameCards()  {
      stacksArray = [stackOne, stackTwo, stackThree, stackFour]
      gameCardViews = [UIView]()
      flippedIndices = [Int]()

      for stackView in stacksArray {
         for cardView in stackView.subviews  {
            gameCardViews.append(cardView)
         }
      }

      setCardColors()

   }

   func setCardColors()   {
      for index in 0...gameCardViews.count-1 {
         if game.cards[index].playable {
            gameCardViews[index].backgroundColor = UIColor.gray
         }
      }
   }

   func addListeners()  {

      for index in 0...gameCardViews.count-1 {
         if game.cards[index].playable {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFlip))
            gameCardViews[index].addGestureRecognizer(gestureRecognizer)
         }
      }

   }

   @objc func handleFlip(_ recognizer:UITapGestureRecognizer) {

      let view = recognizer.view!
      let index = gameCardViews.index(of: view)!
      let flipCard = game.shouldFlip(card: game.cards[index])

      if flipCard {
         flippedIndices.append(index)
         view.backgroundColor = game.cards[index].color
      }

      if game.flippedCards == 2 && flippedIndices.count == 2 {

         let cardOne = self.flippedIndices[0]
         let cardTwo = self.flippedIndices[1]
         let successfulMatch = self.game.checkIfMatch(cardOne: cardOne, cardTwo: cardTwo)
         if successfulMatch {
         }  else  {
            self.gameCardViews[cardOne].backgroundColor = UIColor.gray
            self.gameCardViews[cardTwo].backgroundColor = UIColor.gray
         }

         self.flippedIndices.removeAll()

      }

      if game.succesfulMatches == 16 {
         game.endGame()
         performSegue(withIdentifier: "GameFinishedSegue", sender: self)
      }


   }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if(segue.identifier == "GameFinishedSegue")   {
         if let finishedVC = segue.destination as? GameFinishedViewController {
            if let time = game.totalTime  {
               finishedVC.totalTime = time
            }
         }
      }
   }


      

}

