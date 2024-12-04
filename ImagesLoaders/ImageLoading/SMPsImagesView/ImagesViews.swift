//
//  ImagesViews.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI

struct ImagesViews: View {
    var body: some View {
        //работает через универсальную зависимость Imageloader
        Imageloader(url: "https://picsum.photos/seed/picsum/200/300", contentMode: .fill)
            .frame(width: 200, height: 200)
            .onAppear{
                /*
                 //Для SDWebImageSwiftUI
                 ImagePrefatcher.instance.startPrefetching(urls: [URL(string: "https://picsum.photos/seed/picsum/200/300")!])
                 //предварительная загрузка фотки
                 */
                
                //Для Kingfisher
                ImagePrefatcherKingfisher.instance.startPrefetching(urls: [URL(string: "https://picsum.photos/seed/picsum/200/300")!])
            }
    }
}

#Preview {
    ImagesViews()
}
