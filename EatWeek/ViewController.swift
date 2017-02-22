//
//  ViewController.swift
//  EatWeek
//
//  Created by Alexander Pacini on 2/21/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var days = [Day]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }

}

