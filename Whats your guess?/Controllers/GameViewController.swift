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

   var stacksArray : [UIStackView]!, gameCardViews : [UIView]!
   
   override func viewDidLoad() {

      super.viewDidLoad()

      game = Game()

      setGameCards()

      addListeners()

      // Do any additional setup after loading the view, typically from a nib.

   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   func setGameCards()  {
      stacksArray = [stackOne, stackTwo, stackThree, stackFour]
      gameCardViews = [UIView]()

      for stackView in stacksArray {
         for cardView in stackView.subviews  {
            gameCardViews.append(cardView)
         }
      }

      setCardColors()

   }

   func setCardColors()   {
      for index in 0...gameCardViews.count-1 {
         gameCardViews[index].backgroundColor = UIColor.gray
      }
   }

   func addListeners()  {

      for view in gameCardViews {
         let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFlip))
         view.addGestureRecognizer(gestureRecognizer)
      }

   }

   @objc func handleFlip(_ recognizer:UITapGestureRecognizer) {
      let view = recognizer.view!
      let index = gameCardViews.index(of: view)!
      view.backgroundColor = game.cards[index].color
   }


      

}

