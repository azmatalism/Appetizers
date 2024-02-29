//  Created by uk laptop on 27/02/2024.

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description of the appetier",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 89,
                                           carbs: 78)
    static let appetizer        = [sampleAppetizer, sampleAppetizer, sampleAppetizer,sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    
    
    
    static let orderItemOne  = Appetizer(id: 0002,
                                           name: "Test Appetizer One",
                                           description: "This is the description of the appetier",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 89,
                                           carbs: 78)
    static let orderItemTwo  = Appetizer(id: 0001,
                                           name: "Test Appetizer Two",
                                           description: "This is the description of the appetier",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 89,
                                           carbs: 78)
    static let orderItemThree  = Appetizer(id: 0003,
                                           name: "Test Appetizer Three",
                                           description: "This is the description of the appetier",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 89,
                                           carbs: 78)
    
    static let orderItem            = [orderItemOne, orderItemTwo, orderItemThree]
}
