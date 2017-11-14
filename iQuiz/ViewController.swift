//
//  ViewController.swift
//  iQuiz latest v
//
//  Created by iGuest on 11/12/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var qNum : Int = -1
    let tableCells = ["Mathematics", "Marvel Super Heroes", "Science"]
    let desc = ["numbers and what not", "archnemesis of DC", "BILL NYE THE SCIENCE GUY"]
    let images = ["math", "marvel", "science"]
    let allQs : [(topic : String, qs : [(q : String, a : Int, answers : [String])])] =
        [(topic : "Mathematics", qs : [(q : "1 + 1 =?", a : 1, answers : ["1", "2", "3", "4"]),
                                       (q : "1 + 2 =?", a : 2, answers : ["5", "4", "3", "1"]),
                                       (q : "1 + 9 =?", a : 3, answers : ["2", "5", "3", "10"]),
                                       (q : "1 + 4 =?", a : 0, answers : ["5", "2", "12", "3"])]),
         (topic : "Marvel", qs : [(q : "marvel1", a : 0, answers : ["answer", "o2", "o3", "o4"]),
                            (q : "marvel2", a : 1, answers : ["o1", "answer", "o3", "o4"]),
                            (q : "marvel3", a : 2, answers : ["o1", "o2", "answer", "o4"])]),
         (topic : "Science", qs : [(q : "", a : 0, answers : ["answer", "o2", "o3", "o4"]),
                            (q : "science1", a : 1, answers : ["o1", "answer", "o3", "o4"]),
                            (q : "science2", a : 3, answers : ["o1", "o2", "o3", "answer"])])]
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func alertSetting(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        qNum = indexPath.row
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let qs: QuestionViewController = segue.destination as! QuestionViewController
        qs.t = qNum
        qs.q = allQs[qNum].qs[0].q
        qs.options = allQs[qNum].qs[0].answers
        qs.correct = allQs[qNum].qs[0].a
        qs.allQs = allQs
        qs.num = 0
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.textLabel!.text = tableCells[indexPath.row]
        cell.detailTextLabel?.text = desc[indexPath.row]
        cell.detailTextLabel?.numberOfLines = 2;

        cell.imageView?.image = UIImage(named: (images[indexPath.row] + ".png"))

        return cell
    }
   
}

