//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import SwiftUI

struct TextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "hello")
    }
}
