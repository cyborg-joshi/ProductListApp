# Product List App

## Overview

This project is a product List app developed using SwiftUI, following the MVVM (Model-View-ViewModel) architecture pattern. It allows users to view a list of products, search for specific products, and add new products through a user-friendly interface. The app fetches product data from a remote API and includes features like asynchronous image loading and form validation.

## Features

- **View Products:** Display a list of products with detailed information.
- **Search Products:** Use a search bar to filter products by name.
- **Add Products:** Add new products through a form with validation.
- **Asynchronous Image Loading:** Load and display product images asynchronously.

## Technologies Used

- SwiftUI
- Combine
- MVVM Architecture
- URLSession for API requests

## Project Structure
ProductManagementApp/
├── ViewModels/
│ ├── ProductListViewModel.swift
│ └── AddProductViewModel.swift

├── Views/
│ ├── ProductListView.swift
│ ├── AddProductView.swift
│ ├── ProductRow.swift
│ └── SearchBar.swift

├── Models/
│ ├── Product.swift
│ └── AddProductResponse.swift
├── ProductManagementAppApp.swift


## File Descriptions

### `ProductManagementAppApp.swift`
- **Purpose:** Entry point of the application. Initializes the main window and sets `ProductListView` as the root view.

### `ViewModels/`
- **`ProductListViewModel.swift`:** Manages the state and business logic for the product list screen. Fetches products from the API and handles search functionality.
- **`AddProductViewModel.swift`:** Manages the state and business logic for the add product screen. Validates user input and submits new products to the API.

### `Views/`
- **`ProductListView.swift`:** Displays a list of products and includes a search bar and navigation to the add product screen.
- **`AddProductView.swift`:** Provides a form for adding new products, including fields for product name, type, price, and tax.
- **`ProductRow.swift`:** Custom view for displaying individual product details in the list.
- **`SearchBar.swift`:** Custom search bar component for filtering products by name, implemented using `UIViewRepresentable` to bridge UIKit's `UISearchBar` with SwiftUI.

### `Models/`
- **`Product.swift`:** Defines the `Product` model with properties for image, price, product name, product type, and tax. Conforms to `Identifiable` and `Decodable`.
- **`AddProductResponse.swift`:** Defines the response model for adding a product, including a message and product details.

## Setup and Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/cyborg-joshi/ProductListApp.git
Open the project:
Open ProductListApp.xcodeproj in Xcode.
Run the project:

Select the target device or simulator and click the Run button in Xcode.
Usage

Viewing Products:

Launch the app to see a list of products.
Use the search bar at the top to filter products by name.
Adding Products:

Tap the "Add Product" button to navigate to the add product screen.

Fill in the product details and tap "Submit" to add a new product.

