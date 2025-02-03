//
//  ContentView.swift
//  LittleLemonCapstone2
//
//  Created by Cindy Wai Yan Cheung on 23/1/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isLoggedin : Bool  = UserDefaults.standard.bool(forKey: "isLoggedInKey")

        var body: some View {
        NavigationStack {
           Onboarding(isLoggedin: $isLoggedin)
        }
        .navigationBarBackButtonHidden(true)
    }
 }

#Preview {
    ContentView()
}
