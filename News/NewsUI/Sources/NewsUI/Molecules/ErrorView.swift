//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 09/11/2022.
//

import SwiftUI

struct ErrorView: View {
    var message: String
    var body: some View {
        VStack {
            Image(systemName: "error")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(message)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Error message")
    }
}
