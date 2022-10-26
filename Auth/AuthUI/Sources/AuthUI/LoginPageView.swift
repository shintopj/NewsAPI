//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import SwiftUI
import AuthPresenter

public struct LoginPageView: View {
    
    @ObservedObject var store: LoginStore
    @State var name: String = ""
    
//    var callback: (() -> Void)
    
    
    public init(store: LoginStore /*, callback: @escaping (() -> Void)*/) {
        self.store = store
//        self.callback = callback
    }
    
    public var body: some View {
        
        VStack {
            TextField("Name", text: $name)
            
            Button("Login") {
                store.login(name: name)
                    //            callback()
            }
        }
        .padding()
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView(store: LoginStore())
    }
}
