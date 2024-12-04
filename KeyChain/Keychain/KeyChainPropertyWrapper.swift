//
//  KeyChainPropertyWrapper.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import KeychainSwift

final class KeychainManagerPW {
    let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        //синхронизация со всеми устройствами использующими общий iCloud
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

@propertyWrapper
struct KeyChainStorage: DynamicProperty {
    @State private var newValue : String
    let key: String
    let keychain: KeychainManagerPW
    var wrappedValue: String {
        get{
            newValue
        }
        nonmutating set{
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }
    }
    
    init(wrappedValue: String, key: String) {
        self.key = key
        let keychain = KeychainManagerPW()
        self.keychain = keychain
        newValue = keychain.get(key: key) ?? ""
        print("SUCCES READ")
    }
    
    func save(newValue: String){
        keychain.set(newValue, key: key)
        self.newValue = newValue
        print("SUCCES SAVED")
    }
}

struct KeyChainPropertyWrapper: View {
    @KeyChainStorage(key: "user_password") var userPassword: String = ""
    var body: some View {
        Button(userPassword.isEmpty ? "user password is Empty" : userPassword) {
            let newPassword = "testPasspord"
            userPassword = newPassword
        }
    }
}

#Preview {
    KeyChainPropertyWrapper()
}
