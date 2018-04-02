//
//  Game.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/26/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import Foundation
import RandomColorSwift
import Dispatch

class Game  {

   var cards : [GameCard]!
   var flippedCards : Int!, succesfulMatches : Int!
   var startTime : Date!, totalTime : Double?

   init()   {

      createGame()

   }

   private func createGame()  {

      self.flippedCards = 0
      self.succesfulMatches = 0
      cards = [GameCard]()

      let hueOptions : [Hue] = [.blue, .green, .monochrome, .orange, .purple,
                                .red, .yellow, .pink]
      let luminosityOptions : [Luminosity] = [.bright, .dark, .light]

      for index in 1...8   {
         let generatedColor = randomColor(hue: hueOptions[index-1],
                                 luminosity: luminosityOptions[Int(arc4random_uniform(3))])
         let card : GameCard = GameCard(color: generatedColor, id: UUID.init())
         let matchingColorCard = GameCard(color: generatedColor, id: UUID.init())
         cards.append(card)
         cards.append(matchingColorCard)
      }

      shuffleCards()

      startTime = Date.init()

   }

   public func shuffleCards() {
      for _ in 0...1000 {
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

   public func shouldFlip(card : GameCard) -> Bool   {
      if card.flipped || !card.playable {
         return false
      }  else if flippedCards == 0 || flippedCards == 1  {
         flippedCards? += 1
         card.flipCard()
         return true
      }
      return false
   }

   public func resetFlippedCards() {
      flippedCards = 0
   }

   public func addSuccessfulMatch() {
      succesfulMatches? += 2
   }

   public func checkIfMatch(cardOne : Int, cardTwo : Int) -> Bool {
      if cards[cardOne] == cards[cardTwo] {
         cards[cardOne].removeFromGame()
         cards[cardTwo].removeFromGame()
         resetFlippedCards()
         addSuccessfulMatch()
         return true
      }
      cards[cardOne].flipCard()
      cards[cardTwo].flipCard()
      resetFlippedCards()
      return false
   }

   public func endGame()   {
      totalTime = (Date.init().timeIntervalSince(startTime) * 100).rounded()
      totalTime = totalTime! / 100
   }

}
