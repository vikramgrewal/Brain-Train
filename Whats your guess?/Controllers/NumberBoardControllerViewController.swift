//
//  NumberBoardControllerViewController.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/25/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit

class NumberBoardControllerViewController: UIViewController {

   @IBOutlet var numberBoard : NumberBoard!

   init(frame: CGRect)   {
      numberBoard = NumberBoard(frame: frame)
   }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
