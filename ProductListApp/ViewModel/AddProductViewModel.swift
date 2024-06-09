//
//  AddProductViewModel.swift
//  ProductListApp
//
//  Created by KANISHK on 09/06/24.
//

import Foundation
import SwiftUI

class AddProductViewModel: ObservableObject {  //Allows the ViewModel to publish changes to its properties.
    @Published var productName = ""
    @Published var productType = "Product"
    @Published var price = ""
    @Published var tax = ""
    @Published var showingAlert = false
    @Published var alertMessage = ""

    func submitProduct() {
        guard !productName.isEmpty, !price.isEmpty, !tax.isEmpty, let _ = Double(price), let _ = Double(tax) else {
            alertMessage = "Please fill in all fields correctly."
            showingAlert = true
            return
        }

        guard let url = URL(string: "https://app.getswipe.in/api/public/add") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        var formData = [String: String]()
        formData["product_name"] = productName
        formData["product_type"] = productType
        formData["price"] = price
        formData["tax"] = tax

        request.httpBody = formData.map { key, value in
            "\(key)=\(value)"
        }.joined(separator: "&").data(using: .utf8)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(AddProductResponse.self, from: data)
                DispatchQueue.main.async {
                    self.alertMessage = response.message
                    self.showingAlert = true
                }
            } catch {
                print("Error decoding response: \(error)")
                DispatchQueue.main.async {
                    self.alertMessage = "Failed to decode response"
                    self.showingAlert = true
                }
            }
        }.resume()
    }
}
