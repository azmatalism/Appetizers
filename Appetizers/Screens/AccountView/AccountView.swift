//  Created by uk laptop on 27/02/2024.

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    //change focuse keyboard manully when user hit next button
    @FocusState private var focusedTestField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    //change focuse keyboard
                        .focused($focusedTestField, equals: .firstName)
                        .onSubmit { focusedTestField = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                    //change focuse keyboard
                        .focused($focusedTestField, equals: .lastName)
                        .onSubmit { focusedTestField = .email}
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                    //change focuse keyboard
                        .focused($focusedTestField, equals: .email)
                        .onSubmit { focusedTestField = .lastName}
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    // Pick any date
                    //DatePicker("Birthday", selection: $viewModel.user.birthdate,
                               //displayedComponents: .date)
                    // Not older the 18 years old Pick any date
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in:Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section (header: Text("Request")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .appMainColor))
            }
            .navigationTitle(" 🔐 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss"){focusedTestField = nil}
                }
            }
        }
        .onAppear {
            viewModel.retrieveUserSavedData()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )}
    }
}

#Preview {
    AccountView()
}
