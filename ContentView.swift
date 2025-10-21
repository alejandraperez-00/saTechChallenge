//
//  ContentView.swift
//  saTechChallenge
//  Created by Alejandra Perez on 10/16/25.
//
import SwiftUI
import IterableSDK

struct ContentView: View {
    @State private var embeddedMessage: IterableEmbeddedMessage?

    var body: some View {
        VStack(spacing: 20) {
            // Profile update
            Button("Update Profile") {
                updateUserProfile()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Custom event
            Button("Send Custom Event") {
                sendCustomEvent()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Embedded Message 
            if let message = embeddedMessage {
                IterableEmbeddedViewWrapper(
                    embeddedMessage: message,
                    viewType: .card
                )
                .frame(height: 300)
                .padding()
            } else {
                Text("No embedded message found.")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            // Fetch embedded messages
            let messages = IterableAPI.embeddedManager.getMessages()
            if let first = messages.first {
                embeddedMessage = first
            }
        }
    }

    func updateUserProfile() {
        let userInfo: [String: Any] = [
            "firstName": "Alejandra",
            "isRegisteredUser": true,
            "SA_User_Test_Key": "completed"
        ]

        IterableAPI.updateUser(userInfo, mergeNestedObjects: true)
        print("User profile updated!")
    }

    func sendCustomEvent() {
        let eventData: [String: Any] = [
            "platform": "iOS",
            "isTestEvent": true,
            "url": "https://iterable.com/sa-test/Alejandra",
            "secret_code_key": "Code_123"
        ]

        IterableAPI.track(
            event: "mobileSATestEvent",
            dataFields: eventData
        )

        print("Custom event sent!")
    }
}


