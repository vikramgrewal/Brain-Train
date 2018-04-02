//
//  GameEntryViewController.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/29/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit

class GameEntryViewController: UIViewController {

   @IBOutlet weak var brandLabel: UILabel!

   override func viewDidLoad() {
        super.viewDidLoad()

      setContent()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   func setContent()   {
      brandLabel.sizeToFit()
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
