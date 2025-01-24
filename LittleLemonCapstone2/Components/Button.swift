import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10) // *make it thinner*
            .frame(width: 300) // expand horizontally
            .foregroundColor(.white)
            .background(
                Rectangle()
                    .background(Color.green)
                    .cornerRadius(12)
            )
            .padding(.horizontal, 10) // *margin of 10px on each side*
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
