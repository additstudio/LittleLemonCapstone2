//
//  ContentView.swift
//  LittleLemonCapstone2
//
//  Created by Cindy Wai Yan Cheung on 23/1/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {

        var body: some View {
        NavigationStack {
            Onboarding()
        }
        .navigationBarBackButtonHidden(true)
    }
 }

#Preview {
    ContentView()
}
