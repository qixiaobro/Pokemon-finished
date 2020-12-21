//
//  BlurView.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    let view = UIView(frame: .zero)
    
    init(style: UIBlurEffect.Style) { print("Init")
     self.style = style
    }
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        print("makeUIView")
        
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor
                .constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor
                .constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        print("Update")
        uiView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor
                .constraint(equalTo: uiView.heightAnchor),
            blurView.widthAnchor
                .constraint(equalTo: uiView.widthAnchor)
        ])
    }
}

//创建View 的扩展。
extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}
