//  Created by uk laptop on 28/02/2024.

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.appMainColor)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "Button")
}
