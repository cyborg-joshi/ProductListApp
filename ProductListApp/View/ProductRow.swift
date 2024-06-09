//
//  ProductRow.swift
//  ProductListApp
//
//  Created by KANISHK on 09/06/24.
//

import Foundation
import SwiftUI
// View representing a single product row.
struct ProductRow: View {
    let product: Product
    // Displays the product image asynchronously.
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.gray)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(product.product_name)
                    .font(.headline)
                Text(product.product_type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Price: \(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                Text("Tax: \(product.tax, specifier: "%.2f")")
                    .font(.subheadline)
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
