//
//  NumberBoard.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/25/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit

class NumberBoard: UIView {

   @IBOutlet var numberBoardView: UIView!
   @IBOutlet var gameButtons : [UIButton]?

   /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

   override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()

      gameButtons = getGameButtonsOfView(view: self)
      

   }

   required init?(coder aDecoder: NSCoder)   {
      super.init(coder: aDecoder)
      commonInit()
   }

   private func commonInit()  {
      Bundle.main.loadNibNamed("NumberBoard", owner: self, options: nil)
      addSubview(numberBoardView)
      numberBoardView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
   }

   func getGameButtonsOfView(view: UIView) -> [UIButton] {
      var subviewArray = [UIButton]()
      for subview in view.subviews {
         subviewArray += self.getGameButtonsOfView(view: subview)
         if let subview = subview as? UIButton {
            subviewArray.append(subview)
         }
      }
      return subviewArray
   }

}
