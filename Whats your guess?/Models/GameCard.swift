//
//  GameCard.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/27/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import Foundation
import UIKit

class GameCard : Equatable {

   var playable : Bool!
   var flipped : Bool!
   var color : UIColor!
   var id : UUID!

   init(color : UIColor, id : UUID)   {
      self.playable = true
      self.flipped = false
      self.color = color
      self.id = id
   }

   public func flipCard()  {
      self.flipped = !self.flipped
   }

   static func == (lhs: GameCard, rhs: GameCard) -> Bool {
      return lhs.id != rhs.id && rhs.id != lhs.id
         && lhs.color.isEqual(rhs.color) && rhs.color.isEqual(lhs.color)
   }

   public func removeFromGame()  {
      self.playable = false
   }

}
