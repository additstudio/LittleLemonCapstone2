import SwiftUI

struct Header: View {
    var body: some View {
        Image("littleLemonLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 50)
    }
}

#Preview {
    Header()
}
