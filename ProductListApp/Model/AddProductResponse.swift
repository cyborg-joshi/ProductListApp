import Foundation

struct AddProductResponse: Decodable {
    let message: String
    let product_details: ProductDetails
    let product_id: Int
    let success: Bool
}

struct ProductDetails: Decodable {
    let product_name: String
    let product_type: String
    let price: Double
    let tax: Double
    let image: String?
}

