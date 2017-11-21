//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/13/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var t: Int = -1
    var q : String = ""
    var correct : Int = -1
    var options : [String] = []
    
    var chosen : Int = -1
    var num : Int = -1
    var score : Int = 0
    var qs : [String] = [] // list of qs
    var answers : [[String]] = [] // list of answers for each
    var correctA : [Int]  = [] // list of correct answers
    
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var o1: UIButton!
    @IBOutlet weak var o2: UIButton!
    @IBOutlet weak var o3: UIButton!
    @IBOutlet weak var o4: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //topic.text = allQs[t].topic
        question.text = q
        o1.setTitle(options[0], for: UIControlState.normal)
        o2.setTitle(options[1], for: UIControlState.normal)
        o3.setTitle(options[2], for: UIControlState.normal)
        o4.setTitle(options[3], for: UIControlState.normal)
        submit.isEnabled = false;
        submit.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        submit.setTitle("Please choose an option to enable submit", for: UIControlState.disabled)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseO1(_ sender: Any) {
        o1.backgroundColor = UIColor.purple
        o2.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o3.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o4.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        submit.isEnabled = true;
        chosen = 0
    }

    @IBAction func chooseo2(_ sender: Any) {
        o1.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o2.backgroundColor = UIColor.purple
        o3.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o4.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        submit.isEnabled = true;
        chosen = 1
    }
    
    @IBAction func chooseO3(_ sender: Any) {
        o1.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o2.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o3.backgroundColor = UIColor.purple
        o4.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        submit.isEnabled = true;
        chosen = 2
    }
    
    @IBAction func chooseO4(_ sender: Any) {
        o1.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o2.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o3.backgroundColor = UIColor(red:0.53, green:0.86, blue:0.97, alpha:1.0)
        o4.backgroundColor = UIColor.purple
        submit.isEnabled = true;
        chosen = 3
    }

    @IBAction func clickSubmit(_ sender: Any) {
        performSegue(withIdentifier: "toAnswer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtoQs" {
            let q: ViewController = segue.destination as! ViewController
        } else {
            let answer: AnswerViewController = segue.destination as! AnswerViewController
            answer.q = self.q
            answer.score = self.score
            answer.correctAnswer = self.options[correct]
            answer.isCorrect = (chosen == correct)
            answer.num = self.num + 1
            answer.t = self.t
            
            answer.qs = self.qs
            answer.answers = self.answers
            answer.correctA = self.correctA
        }
    }

    @IBAction func backPressed(_ sender: Any) {
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
