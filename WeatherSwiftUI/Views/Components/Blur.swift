//
//  Blur.swift
//  WeatherSwiftUI
//
//  Created by Владислав Калинин on 21.11.2022.
//

import SwiftUI

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIBackdropView  {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIBackdropView, context: Context) {
        
    }
}

struct Blur: View {
    
    var radius: CGFloat = 3
    var opague: Bool = false
    
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opague)
    }
}

//struct Blur_Previews: PreviewProvider {
//    static var previews: some View {
//        Blur()
//    }
//}
