//
//  LottieView.swift
//  SwiftPackages
//
//  Created by Dmitriy Eliseev on 04.12.2024.
//

import SwiftUI
import Lottie

//.json <- old format
//.dotlottie <- NEW


//Создаем отдельную структуру для инъекции зависимости
struct LottieHelperView: View {
    let filename: String
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playloopMode: LottieLoopMode
    var onDidFinish: (() -> Void)? = nil
    var body: some View {
        LottieView(animation: .named(filename))
            .configure({ lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playloopMode)))
            .animationDidFinish { completed in
                if completed {
                    onDidFinish?()
                }
            }
        //1 - .loop - от начала и до конца и опять начинает с 1
        //1 - .autoReverse - честно говоря не понимаю в чем разница
        //playOnce - однократная анимация
    }
}

struct LottieViewSPM: View {
    var body: some View {
        LottieHelperView(filename: "Santa", playloopMode: .repeat(5)) {
            print("Конец анимации")
        }
    }
}

#Preview {
    LottieViewSPM()
}
