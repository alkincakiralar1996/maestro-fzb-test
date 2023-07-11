//
//  ContentView.swift
//  iOSTestFizbot
//
//  Created by Alkın Çakıralar on 12.06.2023.
//

import AuthenticationServices
import OSLog
import SwiftUI

class TstVM: ObservableObject {
    var user: Int = 5

    func fetchUsers(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5, execute: {
            completion()
        })
    }

    func test() {
        fetchUsers { [weak self] in
            self?.user = 10
        }
    }
}

struct ContentView: View {
    @State private var isSensitive = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, worlasdadsadasd!")
            Button("CLICK") {
            }
        }
        .padding()
    }
}
