//
//  KeyChainSPM.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

/*
 Простая работа с библиотекой KeychainSwift
 */

import SwiftUI
import KeychainSwift

/*
 Keychain – это надежное хранилище. В нем вы можете хранить все виды конфиденциальных данных: пароли пользователей, номера кредитных карт, секретные токены и т. д. После сохранения в «Связке ключей» эта информация доступна только вашему приложению, другие приложения не смогут ее увидеть. Кроме того, операционная система обеспечивает безопасное хранение и обработку этой информации. Например, текст, хранящийся в «Связке ключей», невозможно извлечь из резервной копии iPhone или из его файловой системы. Apple рекомендует хранить в связке ключей лишь небольшой объем данных. Если вам нужно защитить что-то большое, вы можете зашифровать его вручную, сохранить в файл и сохранить ключ в связке ключей.
 */

struct KeyChainSPM: View {
    let keychain = KeychainSwift()
    @State private var userPassword = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "user password is Empty" : userPassword) {
            keychain.set("123456789", forKey: "user_password", withAccess: .accessibleWhenUnlocked)
            //синхронезация со всеми устройствами использующими общий iCloud
            keychain.synchronizable = true
            //удаление по ключу
            keychain.delete("user_password")
            //отчистка всех ключей
            keychain.clear()
        }
        .onAppear{
            userPassword = keychain.get("user_password") ?? ""
        }
    }
}

#Preview {
    KeyChainSPM()
}
