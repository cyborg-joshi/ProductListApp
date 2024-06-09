//
//  Product.swift
//  ProductListApp
//
//  Created by KANISHK on 09/06/24.
//

import Foundation
struct Product: Identifiable, Decodable {
    let image: String
    let price: Double
    let product_name: String
    let product_type: String
    let tax: Double
    
   // Computed property to provide a unique identifier
    var id: String {
            return product_name // Assuming product_name is unique
        }
}

