//
//  ViewController.swift
//  iQuiz latest v
//
//  Created by iGuest on 11/12/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    let tableCells = ["Mathematics", "Marvel Super Heroes", "Science"]
    let desc = ["numbers and what not", "archnemesis of DC", "BILL NYE THE SCIENCE GUY"]
    let images = ["math", "marvel", "science"]
    
    
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

