//
//  KeyChainEnvironment.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import KeychainSwift

final class KeychainEnvironmentManager {
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
}

struct KeychainManagerKey: EnvironmentKey {
    static var defaultValue: KeychainEnvironmentManager = KeychainEnvironmentManager()
}

extension EnvironmentValues {
    var keychain: KeychainEnvironmentManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

struct KeyChainEnvironment: View {
    //работа с Keychain через @Environment
    @Environment(\.keychain) var keychain
    @State private var userPassword = ""
    var body: some View {
        Button(userPassword.isEmpty ? "user password is Empty" : userPassword) {
            let newPassword = "abc"
            keychain.set(newPassword, key: "user_password")
        }
        .onAppear{
            userPassword = keychain.get(key: "user_password") ?? "no value"
        }
    }
}

#Preview {
    KeyChainEnvironment()
}



