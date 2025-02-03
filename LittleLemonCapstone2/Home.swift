import SwiftUI
import UIKit

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    @Binding var isLoggedin: Bool
    
    var body: some View {
        Header()
        
        TabView {
            Menu()
                .tabItem({Label("Menu", systemImage: "list.dash")})
                .navigationBarTitle("Menu")
                .frame(alignment:.top)
            UserProfile(isLoggedin : $isLoggedin)
                .tabItem({Label("Profile", systemImage: "square.and.pencil")})
                .navigationBarTitle("Profile")
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistence.container.viewContext)
        
    }
    
}

#Preview {

}
