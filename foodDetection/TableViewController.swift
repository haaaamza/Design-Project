//
//  TableViewController.swift
//  foodDetection
//
//  Created by Qiang Xu on 2019-12-05.
//  Copyright © 2019 Qiang Xu. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var caloriesFromFat: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var saturatedFat: UILabel!
    @IBOutlet weak var transFattyAcid: UILabel!
    @IBOutlet weak var cholesterol: UILabel!
    @IBOutlet weak var sodium: UILabel!
    @IBOutlet weak var totalCarbohydrate: UILabel!
    @IBOutlet weak var dietaryFiber: UILabel!
    @IBOutlet weak var sugars: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var vitaminA: UILabel!
    @IBOutlet weak var vitaminC: UILabel!
    @IBOutlet weak var calcium: UILabel!
    @IBOutlet weak var iron: UILabel!
    @IBOutlet weak var servingSizeQty: UILabel!
    @IBOutlet weak var servingSizeUnit: UILabel!
    
    
    var finalLabel = ""
    var fields = NutritionFields()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let nutritionRequest = NutritionRequest(food: finalLabel)
        let serialQueue = DispatchQueue(label: "SerialQueue")
        nutritionRequest.getNutrition { [weak self] result in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let fields):
                    self?.fields = fields
                DispatchQueue.main.async {
                    self?.itemName.text = "Item Name: " + (self?.fields.item_name ?? "0")
                    self?.calories.text = "Calories: " + String(self?.fields.nf_calories ?? 0)
                    self?.caloriesFromFat.text = "Calories from fat: " + String(self?.fields.nf_calories_from_fat ?? 0)
                    self?.totalFat.text = "Total fat: " + String(self?.fields.nf_total_fat ?? 0)
                    self?.saturatedFat.text = "Saturated fat: " + String(self?.fields.nf_saturated_fat ?? 0)
                    self?.transFattyAcid.text = "Trans fatty acid: " + String(self?.fields.nf_trans_fatty_acid ?? 0)
                    self?.cholesterol.text = "Cholesterol: " + String(self?.fields.nf_cholesterol ?? 0)
                    self?.sodium.text = "Sodium: " + String(self?.fields.nf_sodium ?? 0)
                    self?.totalCarbohydrate.text = "Total Carbohydrate: " + String(self?.fields.nf_total_carbohydrate ?? 0)
                    self?.dietaryFiber.text = "Dietary fiber: " + String(self?.fields.nf_dietary_fiber ?? 0)
                    self?.sugars.text = "Sugars: " + String(self?.fields.nf_sugars ?? 0)
                    self?.protein.text = "Protein: " + String(self?.fields.nf_protein ?? 0)
                    self?.vitaminA.text = "Vitamin A: " + String(self?.fields.nf_vitamin_a_dv ?? 0)
                    self?.vitaminC.text = "Vitamin C: " + String(self?.fields.nf_vitamin_c_dv ?? 0)
                    self?.calcium.text = "Calcium: " + String(self?.fields.nf_calcium_dv ?? 0)
                    self?.iron.text = "Iron: " + String(self?.fields.nf_iron_dv ?? 0)
                    self?.servingSizeQty.text = "Serving size qty: " + String(self?.fields.nf_serving_size_qty ?? 0)
                    self?.servingSizeUnit.text = "Serving size unit: " + (self?.fields.nf_serving_size_unit ?? "0")
                    serialQueue.sync {
                       // update list
                        meals.append(Meal(foodArr:self?.fields.item_name ?? "0", carbArr:(self?.fields.nf_total_carbohydrate ?? 0) ))
                        self?.tableView.reloadData()
                    }
                    self?.tableView.reloadData()
                }
            }
        }
        
        
    }

}

