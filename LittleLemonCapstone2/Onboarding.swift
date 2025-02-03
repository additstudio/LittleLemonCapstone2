import SwiftUI
import UIKit

struct Onboarding: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String=""
    @State var showAlert:Bool = false
    @Binding var isLoggedin : Bool

    @FocusState private var focus: formFieldFocus?
    
    var defaults = UserDefaults.standard
    

    enum formFieldFocus: Hashable {
        case firstName, lastName, email;
    }
    
    enum validateInfoError: Error {
        case firstNameEmpty
        case lastNameEmpty
        case emailEmpty
    }
    
    @State var errorMessage: String = ""

    func validateInfo(firstName: String, lastName: String, email: String) throws {
        if firstName.isEmpty {
            throw validateInfoError.firstNameEmpty
        }
        if lastName.isEmpty {
            throw validateInfoError.lastNameEmpty
        }
        if email.isEmpty {
            throw validateInfoError.emailEmpty
        }
        else {
            defaults.set(firstName, forKey: "FirstNameKey")
            defaults.set(lastName, forKey: "LastNameKey")
            defaults.set(email, forKey: "EmailKey")
            isLoggedin = true
            defaults.set(true, forKey: "isLoggedInKey")
        }
    }
    
     func submit() {
        do {
            try validateInfo(firstName: firstName, lastName: lastName, email: email)
        }
        
        catch validateInfoError.firstNameEmpty {
            errorMessage = "First name is empty"
            showAlert = true
        }
        
        catch validateInfoError.lastNameEmpty {
            errorMessage = "Last name is empty"
            showAlert = true
        }
        
        catch validateInfoError.emailEmpty {
            errorMessage = "Email is empty"
            showAlert = true
        }
        
        catch {
        }
        
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("littleLemonLogo_full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
                Text("Please login to continue")
                    .fontWeight(.bold)
                    .padding()
                VStack(){
                    TextField("First Name", text:$firstName)
                        .focused($focus, equals: .firstName)
                        .onSubmit {
                            focus = .lastName
                        }
                    TextField("Last Name", text:$lastName)
                        .focused($focus, equals: .lastName)
                        .onSubmit {
                            focus = .email
                        }
                    TextField("Email", text:$email)
                        .focused($focus, equals: .email)
                }
                .frame(width: 300)
                .textFieldStyle(.roundedBorder)
                .padding()
                
                    Button("Login"){
                        submit()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                    }
                    .buttonStyle(CustomButtonStyle())
                    .frame(width:300, height: 50)
                    .foregroundStyle(.llGreen)
                    .navigationDestination(isPresented: $isLoggedin) { Home(isLoggedin : $isLoggedin)}
                    .navigationBarBackButtonHidden(true)
                
                
            }

        }

    }
    
}

#Preview {
 }


