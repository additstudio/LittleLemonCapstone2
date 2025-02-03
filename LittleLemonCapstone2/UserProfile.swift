import SwiftUI
import UIKit

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    public let FirstNameKey = "first name key"
    public let LastNameKey = "last name key"
    public let EmailKey = "email key"
    
    
    var firstName = UserDefaults.standard.string(forKey: "FirstNameKey")
    var lastName = UserDefaults.standard.string(forKey: "LastNameKey")
    var email = UserDefaults.standard.string(forKey: "EmailKey")
    
    @State var editProfile: Bool = false
    @State var isLoggedOut: Bool = false
    @Binding var isLoggedin: Bool
    
    func logout() {
        UserDefaults.standard.set(false,forKey: "FirstNameKey")
        UserDefaults.standard.set(false,forKey: "LastNameKey")
        UserDefaults.standard.set(false,forKey: "EmailKey")
        isLoggedOut = true
        isLoggedin = false
        UserDefaults.standard.set(false,forKey: "isLoggedInKey")
    }
    
    
    var body: some View
    {
        
        NavigationStack{
                VStack  {
                    Text("Personal Information")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding()
                        .foregroundColor(.llGreen)
                    VStack {
                        VStack{
                            Image("profile-image-placeholder")
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding()
                    }
                    .padding()
                                        
                    VStack(){
                        HStack{
                            Text("First Name: ")
                            Spacer()
                            Text("\(firstName ?? "")")
                                .frame(width: 250, alignment: .leading)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Last Name:")
                            Spacer()
                            Text("\(lastName ?? "")")
                            .frame(width: 250, alignment: .leading)   }
                        .padding(.bottom)
                        
                        HStack {
                            Text("Email: ")
                            Spacer()
                            Text("\(email ?? "")")
                            .frame(width: 250, alignment: .leading)   }
                    }
                    .padding()
                    .navigationDestination(isPresented: $editProfile) { UserProfileEdit(isLoggedin: $isLoggedin)}
                    .navigationDestination(isPresented: $isLoggedOut) {Onboarding(isLoggedin: $isLoggedin)}
                    
                    Button("Edit Profile") {
                        editProfile = true
                    }
                    .buttonStyle(CustomButtonStyle())
                    .foregroundStyle(.gray)
                    
                    .padding()
                    Button("Logout") {
                        logout()
                    }
                    .buttonStyle(CustomButtonStyle())
                    .foregroundStyle(.llGreen)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            
        }


    }
}

#Preview {

}
