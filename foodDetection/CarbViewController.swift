//
//  CarbViewController.swift
//  foodDetection
//
//  Created by Hamza Mian on 2020-04-12.
//  Copyright © 2020 Qiang Xu. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class CarbViewController: UITableViewController {
    
    @IBAction func refreshClick(_ sender: UIButton) {
        self.tableView.reloadData()
    }
    
    
    
    @IBOutlet weak var CarbClick: UITabBarItem!
    @IBOutlet weak var TotalHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.delegate = self
        tableView.dataSource = self
        super.tableView.reloadData()
    }
   
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.reloadData()
        print("You tapped me")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell2"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CarbsTableViewCell else {
            fatalError("The dequeued cell is not an instance of CarbsTableViewCell.")
        }
        let meal = meals[indexPath.row]
        cell.numCarb.text = String(meal.carbArr)
        cell.foodName.text = meal.foodArr
        return cell
    }
      
    
}
