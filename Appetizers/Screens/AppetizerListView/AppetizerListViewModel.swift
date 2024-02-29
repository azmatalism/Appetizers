//  Created by uk laptop on 27/02/2024.

import Foundation

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    // Get data from url
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                    
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                case .failure(let error):
//                    switch error {
//                        
//                    case.invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    
    // Get data from url
    func getAppetizers(){
        isLoading = true
        
        Task{
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case.invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    self.alertItem = AlertContext.unableToCompleteRequest
                }
                isLoading = false
            }
        }
    }
}
