//
//  Nutrition.swift
//  foodDetection
//
//  Created by Qiang Xu on 2019-12-05.
//  Copyright © 2019 Qiang Xu. All rights reserved.
//

import Foundation

struct NutritionContent: Decodable {
    var hits: [NutritionHits]
}

struct NutritionHits: Decodable {
    var fields: NutritionFields
}

struct NutritionFields: Decodable {
    
    var item_name: String?
    var nf_calories: Double?
    var nf_calories_from_fat: Double?
    var nf_total_fat: Double?
    var nf_saturated_fat: Double?
    var nf_trans_fatty_acid: Double?
    var nf_cholesterol: Double?
    var nf_sodium: Double?
    var nf_total_carbohydrate: Double?
    var nf_dietary_fiber: Double?
    var nf_sugars: Double?
    var nf_protein: Double?
    var nf_vitamin_a_dv: Double?
    var nf_vitamin_c_dv: Double?
    var nf_calcium_dv: Double?
    var nf_iron_dv: Double?
    var nf_serving_size_qty: Double?
    var nf_serving_size_unit: String?
}
