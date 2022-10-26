//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 13/10/2022.
//

import SwiftUI

struct ImageView: View {
    
    var image: UIImage
    var size: CGSize

    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .frame(width: size.width, height: size.height)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: UIImage(systemName: "square.and.arrow.down.on.square")!, size: CGSize(width: 40, height: 40))
    }
}
