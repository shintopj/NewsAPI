//
//  LoadingView.swift
//  
//
//  Created by Shinto Joseph on 10/11/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Image(systemName: "network")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            if #available(iOS 14.0, *) {
                ProgressView()
            } else {
                    // Fallback on earlier versions
            }
            
            TextView(text: "Loading...")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
