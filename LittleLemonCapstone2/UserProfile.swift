import SwiftUI
import UIKit

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    var firstName = UserDefaults.standard.string(forKey: "FirstNameKey")
    var lastName = UserDefaults.standard.string(forKey: "kLastNameKey")
    var email = UserDefaults.standard.string(forKey: "EmailKey")

    @State var newFirstName: String = ""
    @State var newLastName: String = ""
    @State var newEmail: String = ""
    
    func logout() {
        UserDefaults.standard.set(false,forKey: "FirstNameKey")
        UserDefaults.standard.set(false,forKey: "kLastNameKey")
        UserDefaults.standard.set(false,forKey: "EmailKey")
        self.presentation.wrappedValue.dismiss()
    }
    
    
    
    var body: some View
    {
        ZStack{
            Rectangle()
                .fill(Color.clear)
                .border(Color.llGray, width: 2)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
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
//                    Text("Name : \(firstName ?? "") \(lastName ?? "")")
//                        .font(.subheadline)
//                    Text("Email: \(email ?? "")")
//                        .font(.subheadline)
                }
                .padding()
                
                VStack(){
                    HStack{
                        Text("First Name: ")
                        Spacer()
                        TextField("\(firstName ?? "")", text:$newFirstName)
                            .frame(width: 250, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Last Name:")
                        Spacer()
                        TextField("\(lastName ?? "")", text:$newLastName)
                            .frame(width: 250, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Email: ")
                        Spacer()
                        TextField("\(email ?? "")", text:$newEmail)
                            .frame(width: 250, alignment: .trailing)
                    }
                }
                
                .textFieldStyle(.roundedBorder)
                .padding()
                
                Button("Logout") {
                    logout()
                }
                .buttonStyle(CustomButtonStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            
        }
    }

}

#Preview {
    UserProfile()
}
