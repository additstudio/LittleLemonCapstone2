import Foundation
import SwiftUI

struct CategoryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 110, height: 30)
            .foregroundColor(.llGreen)
            .background(
                Rectangle()
                    .frame(width: 110, height: 30)
                    .cornerRadius(8)
            )
            .padding(.horizontal,5) // *margin of 10px on each side*
            .opacity(configuration.isPressed ? 0.7 : 1)
            .font(.system(size: 15, weight: .bold))

    }
}

/*Rectangle()
    .fill(Color.llGray.opacity(1))
    .frame(width: 120, height: 30)
    .cornerRadius(8)
Text("\(category.rawValue)")
    .font(.system(size: 15, weight: .bold))
    .foregroundColor(.llGreen)
*/
