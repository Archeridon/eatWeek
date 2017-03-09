//
//  TVViewController.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import UIKit

class TVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
   
    var days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
  //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.days[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

  
    
}
