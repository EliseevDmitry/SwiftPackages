//
//  KingfisherPackage.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import Kingfisher

struct KingfisherPackage: View {
    let url: String
    var contentMode: SwiftUI.ContentMode // SwiftUI. - уточняем для кого, потому что есть и для Kingfisher и для SwiftUI - один и тот же нэйминг - ContentMode
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .onProgress({ receivedSize, totalSize in
               //поработать
            })
            .onFailure({ error in
                print(error.localizedDescription)
            })
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    KingfisherPackage(url: "https://picsum.photos/200/300", contentMode: .fill)
}

/*
KFImage.url(url)
         .placeholder(placeholderImage)
         .setProcessor(processor)
         .loadDiskFileSynchronously()
         .cacheMemoryOnly()
         .fade(duration: 0.25)
         .lowDataModeSource(.network(lowResolutionURL))
         .onProgress { receivedSize, totalSize in  }
         .onSuccess { result in  }
         .onFailure { error in }
*/
