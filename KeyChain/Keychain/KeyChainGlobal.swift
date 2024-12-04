//
//  KeyChainGlobal.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import KeychainSwift

/*
Использование синглтона не подходит под задачи работы с разными группами связки ключей в одном приложении
 
 В iOS и macOS вы можете использовать несколько групп ключей для различных целей, например:

 Для хранения данных, которые могут быть доступны только определенным приложениям.
 Для данных, которые могут быть синхронизированы через iCloud (например, пароли, настройки).
 Для использования данных между приложениями, принадлежащими одной разработчику, если они имеют общие группы ключей.
 Для разных задач нужно использовать разные группы ключей, чтобы ограничить доступ и обеспечить безопасность. Например, если одно приложение должно иметь доступ только к своим данным, а другое — к данным, которые доступны и для других приложений, то необходимо работать с различными группами ключей.
 */

//Singleton
final class KeychainManager {
    let sharad = KeychainManager()
    let keychain: KeychainSwift
    init() {
        let keychain = KeychainSwift()
        //синхронезация со всеми устройствами использующими общий iCloud
        keychain.synchronizable = true
        self.keychain = keychain
    }
}

struct KeyChainGlobal: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    KeyChainGlobal()
}
