//
//  GameFinishedViewController.swift
//  Whats your guess?
//
//  Created by Vikram Work/School on 3/28/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit

class GameFinishedViewController: UIViewController {

   var totalTime : Double?
   @IBOutlet weak var totalTimeLabel: UILabel!

   override func viewDidLoad() {
        super.viewDidLoad()

         setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   func setupView()  {
      if let labelTime = totalTime {
         totalTimeLabel.text =
            "Total Time: \(String(format: "%.02f", labelTime)) seconds"
      }
   }

   @IBAction func endGame(_ sender: Any) {

      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let entryVC = storyboard.instantiateViewController(withIdentifier: "GameEntryViewController") as! GameEntryViewController
      self.present(entryVC, animated: true, completion: nil)


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
