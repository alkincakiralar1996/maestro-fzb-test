//
//  ContentView.swift
//  iOSTestFizbot
//
//  Created by Alkın Çakıralar on 12.06.2023.
//

import AuthenticationServices
import OSLog
import SwiftUI

struct ContentView: View {
    @State private var isSensitive = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, worljkhjghfasdadsadasd!")
            Button("CLICK") {
            }
        }
        .padding()
    }
}
