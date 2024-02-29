//  Created by uk laptop on 27/02/2024.

import SwiftUI

struct AppetizerLIstView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
   
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                    // Lise line Separator
                        //.listRowSeparator(.hidden)
                        //.listRowSeparatorTint(.appMainColor)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle(" 🍿 Appetizer")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            //            .onAppear {
            //                viewModel.getAppetizers()
            //            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            // Show AppetizerDetailView
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            //Show Loading if the internet are slow
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerLIstView()
}
