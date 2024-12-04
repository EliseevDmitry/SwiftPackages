//
//  ImageLoader.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import SDWebImageSwiftUI

/*
 Структура универсального доступа к загрузки изображений через SDWebImageLoader()
 Реализована возможность корректно отображать  .frame() изображения, в силу того что изображения которые мы грузим из сети, при применении к ним модификатора .frame()  - не применяют его к картинке, и если фрэйм меньше картинки, картинка гакрывает его и может налезть на элементы управления UI
 */
struct Imageloader: View {
    let url: String
    var contentMode: ContentMode
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
/*
меняем зависимость на новый SMP - и не надо менять зависимость во всем приложении (результат
 в - ImagesViews)
*/
                //SDWebImageLoader(url: url, contentMode: contentMode)
                KingfisherPackage(url: url, contentMode: contentMode)
                    .allowsHitTesting(false) //даем возможность обрабатывать нажатие на View через TapGesture
            }
            .clipped()
    }
}

#Preview {
    Imageloader(url: "https://picsum.photos/seed/picsum/200/300", contentMode: .fill)
}
