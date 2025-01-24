import SwiftUI
import UIKit

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        Header()
        
        TabView {
            Menu()
                .tabItem({Label("Menu", systemImage: "list.dash")})
                .navigationBarTitle("Menu")
                .frame(alignment:.top)
            UserProfile()
                .tabItem({Label("Profile", systemImage: "square.and.pencil")})
                .navigationBarTitle("Profile")
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistence.container.viewContext)
        
    }
    
}

#Preview {
    Home()
}
