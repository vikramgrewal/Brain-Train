//
//  Game.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/26/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import Foundation
import RandomColorSwift

class Game  {

   var cards : [GameCard]!

   init()   {
      
      createGame()

   }

   private func createGame()  {

      cards = [GameCard]()

      for _ in 1...8   {
         let generatedColor = randomColor(hue: .random, luminosity: .random)
         let card : GameCard = GameCard(color: generatedColor, id: UUID.init())
         let matchingColorCard = GameCard(color: generatedColor, id: UUID.init())
         cards.append(card)
         cards.append(matchingColorCard)
      }

      shuffleCards()

   }

   func shuffleCards() {
      for _ in 0...100 {
         let randomSwapOne = Int(arc4random_uniform(16))
         let randomSwapTwo = Int(arc4random_uniform(16))
         cards.swapAt(randomSwapOne, randomSwapTwo)
      }
   }

   private func containsColor(color: UIColor) -> Bool  {
      for card in cards {
         if card.color.isEqual(color) {
            return true
         }
      }
      return false
   }
   
}
