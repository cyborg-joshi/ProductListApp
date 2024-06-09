import Foundation
import SwiftUI

// The main view displaying the product list.
struct ProductListView: View {
    // @StateObject: Property wrapper to create an observable object.
    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                CustomSearchBar(text: $viewModel.searchQuery) // Binds the search bar text to the view model's search query
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                if viewModel.isLoading {
                    ProgressView("Loading...")    // Shows a loading indicator while data is being fetched
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(1.5)
                } else {
                    List(viewModel.filteredProducts) { product in
                        ProductRow(product: product)    // Displays a list of filtered products.
                            .listRowBackground(Color(.systemBackground))
                    }
                    .listStyle(PlainListStyle())
                }

                NavigationLink(destination: AddProductView()) {
                    Text("Add Product")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Products")
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}
