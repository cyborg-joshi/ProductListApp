//
//  ProductListViewModel.swift
//  ProductListApp
//
//  Created by KANISHK on 09/06/24.
//

import Foundation
import SwiftUI

class ProductListViewModel: ObservableObject {     //Protocol that allows a class to publish changes to its properties, so views can observe and react to changes.
    // @Published: Property wrapper that triggers view updates when the property changes.
    @Published var products: [Product] = []
    @Published var isLoading = true
    @Published var searchQuery = ""

    var filteredProducts: [Product] {
        if searchQuery.isEmpty {
            return products
        } else {
            return products.filter { $0.product_name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    // Fetches products from the API.
    func fetchProducts() {
        guard let url = URL(string: "https://app.getswipe.in/api/public/get") else {
            print("Invalid URL")
            self.isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in               //creates a publisher that wraps a data task for a URL request.
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            let decoder = JSONDecoder()             // Decodes the data to an array of Product
            do {
                let products = try decoder.decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                    self.isLoading = false
                }
            } catch {
                print("Failed to decode products: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}
