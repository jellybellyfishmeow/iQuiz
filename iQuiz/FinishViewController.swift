//
//  FinishViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/13/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    var score : Int = 0
    var total : Int = 0

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (score == total) {
            message.text = "Congrats! You win!"
        } else {
            message.text = "So close! Better luck next time!"
        }
        scoreDisplay.text = "Score: " + String(score) + "/" + String(total)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        performSegue(withIdentifier: "backtoQs", sender: self)
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
