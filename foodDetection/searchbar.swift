//
//  searchbar.swift
//  foodDetection
//
//  Created by Hamza Mian on 2020-04-04.
//  Copyright © 2020 Qiang Xu. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import Vision

class SearchBar: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var SearchBar: UISearchBar!
    
    var itemName = ""
    
func searchBarSearchButtonClicked(_ SearchBar: UISearchBar){
    self.itemName = SearchBar.text!
    print(SearchBar.text!)
    performSegue(withIdentifier: "search", sender: self)
    
    }
    //FIXME: Pass correct value to nutrition request search.
    let serialQueue = DispatchQueue(label: "SerialQueue")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        serialQueue.sync {
            let vc = segue.destination as! TableViewController
        vc.finalLabel = self.itemName
        }
    }
    
    
    func searchBarCancelButtonClicked(_ SearchBar: UISearchBar){
        SearchBar.text = nil
        SearchBar.resignFirstResponder()
    }
}
