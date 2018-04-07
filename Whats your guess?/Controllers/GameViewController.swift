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

      var buttonIndex : Int = 0
      for stackView in stacksArray {
         for cardView in stackView.subviews  {
            cardView.backgroundColor = game.cards[buttonIndex].color
            cardView.layer.borderWidth = 2.0
            cardView.layer.borderColor = UIColor.white.cgColor

            let button = UIButton(frame: cardView.bounds)
            button.backgroundColor = UIColor(red:0.26, green:0.88,
                                             blue:0.91, alpha:1.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = buttonIndex
            button.layer.borderWidth = 2.0
            button.layer.borderColor = UIColor.white.cgColor
            button.setTitle("?", for: .normal)
            button.titleLabel?.font = button.titleLabel?.font.withSize(100)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.textColor = UIColor.white

            cardView.addSubview(button)

            let centerX = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: cardView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
            let centerY = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: cardView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
            let width = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: cardView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)
            let height = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: cardView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)

            NSLayoutConstraint.activate([centerX, centerY, width, height])
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFlip))
            gameCardViews.append(button)
            gameCardViews[buttonIndex].addGestureRecognizer(gestureRecognizer)
            buttonIndex += 1

         }
      }

//      setCardColors()

   }

//   func setCardColors()   {
//      for index in 0...gameCardViews.count-1 {
//         if game.cards[index].playable {
//            gameCardViews[index].backgroundColor = UIColor.gray
//         }
//      }
//   }


   @objc func handleFlip(_ recognizer:UITapGestureRecognizer) {

      let view = recognizer.view!
      let index = view.tag
      let flipCard = game.shouldFlip(card: game.cards[index])

      if flipCard {
         flippedIndices.append(index)
         view.isHidden = true
      }

      if game.flippedCards == 2 && flippedIndices.count == 2 {

         let cardOne = self.flippedIndices[0]
         let cardTwo = self.flippedIndices[1]
         let successfulMatch = self.game.checkIfMatch(cardOne: cardOne, cardTwo: cardTwo)

         if !successfulMatch {
            self.gameCardViews[cardOne].isHidden = false
            self.gameCardViews[cardTwo].isHidden = false
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

