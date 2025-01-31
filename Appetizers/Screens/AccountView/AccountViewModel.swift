//  Created by uk laptop on 28/02/2024.

import SwiftUI


final class AccountViewModel: ObservableObject {
    //UserDefault Stroage on IOS
    @AppStorage("user")private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    // Save Chages in AcountView
    func saveChanges (){
        guard isValidForm else { return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem  = AlertContext.userSaveSuccess
        }catch {
            alertItem  = AlertContext.userSaveFailed
        }
    }
    func retrieveUserSavedData() {
        guard let userData else {return}
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch {
            alertItem  = AlertContext.userSaveFailed
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    
    
}
