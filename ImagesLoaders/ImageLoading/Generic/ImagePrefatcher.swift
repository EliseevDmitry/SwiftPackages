//
//  ImagePrefatcher.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI


/*
 Предварительная загрузка и кэширование изображений по URL до перехода на страницу
 После перехода вызывая Imageloader() - если фотка загружена в кэш, то тогда она загружается из кэша моментально!
 */

import SDWebImageSwiftUI

final class ImagePrefatcher{
    static let instance = ImagePrefatcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    func startPrefetching(urls: [URL]){
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching(){
        prefetcher.cancelPrefetching()
    }
}

import Kingfisher

final class ImagePrefatcherKingfisher{
    static let instance = ImagePrefatcherKingfisher()
    private var prefetcher: [[URL]:Kingfisher.ImagePrefetcher] = [:]
    
    func startPrefetching(urls: [URL]){
        prefetcher[urls] = Kingfisher.ImagePrefetcher(urls: urls)
        prefetcher[urls]?.start()
    }
    
    func stopPrefetching(urls: [URL]){
        prefetcher[urls]?.stop()
    }
}
