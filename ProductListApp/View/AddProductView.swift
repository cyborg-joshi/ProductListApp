//
//  AddProductView.swift
//  ProductListApp
//
//  Created by KANISHK on 09/06/24.
//

import Foundation
import SwiftUI
// View for adding a new product.
struct AddProductView: View {
    @StateObject private var viewModel = AddProductViewModel()

    var body: some View {
        Form {
            Section(header: Text("Product Details").font(.headline)) {
                TextField("Product Name", text: $viewModel.productName)   // Binds text fields to ViewModel properties./
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker("Product Type", selection: $viewModel.productType) {  // Binds picker selection to ViewModel property.
                    Text("Product").tag("Product")
                    Text("Service").tag("Service")
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("Price", text: $viewModel.price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Tax", text: $viewModel.tax)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            Button(action: viewModel.submitProduct) {  // Calls submitProduct on button tap
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .alert(isPresented: $viewModel.showingAlert) {  // Shows an alert when showingAlert is true.
            Alert(title: Text("Submission"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("Add Product")
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}
