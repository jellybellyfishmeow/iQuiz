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
    var jsonData : NSArray = [""]
    let images = ["science", "marvel", "math"]
    var url : String = "https://tednewardsandbox.site44.com/questions.json"
    let f = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("default.txt")
    var qs : [String] = []
    var answers : [[String]] = []
    var correct : [Int]  = []
    @IBOutlet var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        qNum = indexPath.row
        let subj = (jsonData[indexPath.row] as! [String : Any])["questions"] as! [Any]
        for q in subj {
            let parseQ = q as! [String : Any]
            qs.append(parseQ["text"] as! String)
            var thisOptionAnswers : [String] = []
            for eachOptionAnswer in (parseQ["answers"] as! [String]) {
                thisOptionAnswers.append(eachOptionAnswer)
            }
            answers.append(thisOptionAnswers)
            correct.append(Int(parseQ["answer"] as! String)! - 1)
        }
        performSegue(withIdentifier: "toQuestion", sender: self)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.textLabel!.text = (jsonData[indexPath.row] as! [String : Any])["title"] as? String
        cell.detailTextLabel?.text = (jsonData[indexPath.row] as! [String : Any])["desc"] as? String
        cell.imageView?.image = UIImage(named: (images[indexPath.row] + ".png"))
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSON(url)
        //NSLog(String(describing: self.jsonData))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // HERE'S JSON STUFF
    func getJSON(_ url : String) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) { data, res, err in
            let r = res as! HTTPURLResponse
            NSLog("Response code: %ld", r.statusCode);
            if (r.statusCode == 200) {
                self.jsonData = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                do {
                    try String(data: data!, encoding: .utf8)?.write(to: self.f, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    NSLog(error.localizedDescription + " write")
                }
                //NSLog(String(describing: self.jsonData))
                //NSLog(self.jsonData.description)
            } else {
                do {
                    let t = try String(contentsOf: self.f, encoding: .utf8)
                    let data = t.data(using: String.Encoding.utf8)!
                    self.jsonData = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                } catch {
                    NSLog(error.localizedDescription + "read")
                }
            }
        }.resume()
        self.tableview.reloadData()
    }
    
    func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "enter alternate URL", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "please enter new URL"
        }
        let newURL = UIAlertAction(title: "Check now", style: .default, handler: {
            refresh -> Void in
            self.url = alert.textFields![0].text!
            self.getJSON(self.url)
        })
        alert.addAction(newURL)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in NSLog("cancel")}))
        self.present(alert, animated:true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let qs: QuestionViewController = segue.destination as! QuestionViewController
        qs.t = qNum
        qs.q = self.qs[0]
        qs.options = answers[0]
        qs.correct = correct[0]
        qs.qs = self.qs
        qs.answers = self.answers
        qs.correctA = self.correct
        qs.num = 0
    }
   
}

