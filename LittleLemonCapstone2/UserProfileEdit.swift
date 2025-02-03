//
//  UserProfileEdit.swift
//  LittleLemonCapstone2
//
//  Created by Cindy Wai Yan Cheung on 27/1/2025.
//

import SwiftUI

struct UserProfileEdit: View {
    
    @Environment(\.presentationMode) var presentation
    
    var firstName = UserDefaults.standard.string(forKey: "FirstNameKey")
    var lastName = UserDefaults.standard.string(forKey: "LastNameKey")
    var email = UserDefaults.standard.string(forKey: "EmailKey")

    @State var newFirstName: String = ""
    @State var newLastName: String = ""
    @State var newEmail: String = ""
    @State var changesSaved: Bool = false
    @Binding var isLoggedin : Bool
    
    func saveChanges() {
        if !newFirstName.isEmpty {
            UserDefaults.standard.set(newFirstName,forKey: "FirstNameKey")
        }
        if !newLastName.isEmpty {
            UserDefaults.standard.set(newLastName,forKey: "LastNameKey")
        }
        if !newEmail.isEmpty {
            UserDefaults.standard.set(newEmail,forKey: "EmailKey")
        }
        changesSaved = true
        
    }
    
    var body: some View {
        NavigationStack {

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
                        HStack {
                            Text("First Name:")
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
                    .navigationDestination(isPresented: $changesSaved) { Home(isLoggedin: $isLoggedin)}
                    
                    Button("Save Changes") {
                        saveChanges()
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
