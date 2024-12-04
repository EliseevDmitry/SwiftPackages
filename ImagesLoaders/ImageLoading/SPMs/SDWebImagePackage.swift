//
//  ContentView.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//
/*
 Проверка загрузки фотографий из сети через вэб ресурс:
 https://picsum.photos/
 https://picsum.photos/seed/picsum/200/300
 */
import SwiftUI
import SDWebImageSwiftUI

/*
 Это универсальная зависимость - которая заводится в проект и настраивается в одном месте,
Можем ограничить уровень доступа - fileprivate при организации универсального доступа в рамках использования надстроек через SPM
 В случае замены SPM меняем логику только тут и продолжаем работать со всем приложением без особых проблем
 */

 struct SDWebImageLoader: View {
    let url: String
    var contentMode: ContentMode
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .indicator(.progress)
            .aspectRatio(contentMode: contentMode)
    }
}



#Preview {
    SDWebImageLoader(url: "https://picsum.photos/seed/picsum/200/300", contentMode: .fit)
}

/*
WebImage(url: URL(string: "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic")) { image in
    image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
} placeholder: {
        Rectangle().foregroundColor(.gray)
}
// Supports options and context, like `.delayPlaceholder` to show placeholder only when error
.onSuccess { image, data, cacheType in
    // Success
    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
}
.indicator(.activity) // Activity Indicator
.transition(.fade(duration: 0.5)) // Fade Transition with duration
.scaledToFit()
.frame(width: 300, height: 300, alignment: .center)
*/
