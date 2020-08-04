//
//  NutritionRequest.swift
//  foodDetection
//
//  Created by Qiang Xu on 2019-12-05.
//  Copyright © 2019 Qiang Xu. All rights reserved.
//

import Foundation
import UIKit

enum NutritionError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct NutritionRequest {
    var resourceURL: URL
    
    init(food: String) {
        let destinationURL = "https://api.nutritionix.com/v1_1/search/\(food)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_serving_size_qty%2Cnf_serving_size_unit%2Cnf_calories_from_fat%2Cnf_saturated_fat%2Cnf_trans_fatty_acid%2Cnf_cholesterol%2Cnf_sodium%2Cnf_total_carbohydrate%2Cnf_calories%2Cnf_total_fat%2Cnf_dietary_fiber%2Cnf_sugars%2Cnf_protein%2Cnf_vitamin_a_dv%2Cnf_vitamin_c_dv%2Cnf_calcium_dv%2Cnf_iron_dv&appId=f8617351&appKey=6087753efe5dc5d9dfefecad3a6ead9a&fbclid=IwAR1ACPEilEOPmvlYcbfvG2VcXd5m3BVLPsWtFfDBpVdW4WnuWIKzcBBkKEs"
        guard let resourceURL = URL(string: destinationURL) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getNutrition(completion: @escaping (Result<NutritionFields, Error>) -> ()) {
        
        URLSession.shared.dataTask(with: resourceURL) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            // successful
            do {
                let courses = try JSONDecoder().decode(NutritionContent.self, from: data!)
                let nutritionFields = courses.hits[0].fields
                completion(.success(nutritionFields))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
}
