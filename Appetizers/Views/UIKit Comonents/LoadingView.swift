//  Created by uk laptop on 28/02/2024.


import SwiftUI

//struct ActivityIndicator: UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        let ativityIndicatorView = UIActivityIndicatorView(style: .large)
//        ativityIndicatorView.color = UIColor.appMainColor
//        ativityIndicatorView.startAnimating()
//        return ativityIndicatorView
//    }
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
//}
//
//
//
//struct LoadingView: View {
//    var body: some View {
//        ZStack{
//            Color(.systemBackground)
//                .edgesIgnoringSafeArea(.all)
//            
//            ActivityIndicator()
//        }
//    }
//}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .appMainColor))
                .scaleEffect(2)
        }
    }
}
