//  Created by uk laptop on 29/02/2024.

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    //Total Price to Order View 
    var totalPrice: Double {
        items.reduce(0){$0 + $1.price}
    }
    // Add Order to Order View from Appetizer Details View
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    // Delete Items from Order View
    func deleteItem (at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    
    
}
