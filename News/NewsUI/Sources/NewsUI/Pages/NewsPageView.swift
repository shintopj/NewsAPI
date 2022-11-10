//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 03/10/2022.
//

import SwiftUI
import NewsPresenter

public struct NewsPageView: View {
    
    @ObservedObject var store: NewsPresenter
    var callBack: (NewsDetailsModel) -> Void
    
    public init(store: NewsPresenter, callBack: @escaping (NewsDetailsModel) -> Void) {
        self.store = store
        self.callBack = callBack
    }
    
    public var body: some View {
        VStack {
            if let items = store.list {
                NewsListView(items: items) { item in
                    callBack(store.getNewsDetailsModel(from: item))
                }
            } else if let error = store.error {
                ErrorView(message: error.localizedDescription)
                .padding()
            } else {
                LoadingView()
            }
        }
    }
}

struct NewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPageView(store: NewsPresenter(url: URL(string: "https://hoogle.com")!)) { details in
        }
    }
}
