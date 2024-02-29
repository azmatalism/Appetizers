//  Created by uk laptop on 29/02/2024.

import SwiftUI

struct StanderdButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.appMainColor)
            .controlSize(.large)
    }
}

