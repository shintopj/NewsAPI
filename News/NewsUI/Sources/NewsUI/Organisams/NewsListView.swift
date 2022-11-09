//
//  NewsListView.swift
//  
//
//  Created by Shinto Joseph on 09/11/2022.
//

import SwiftUI
import NewsPresenter

struct NewsListView: View {
    
    private var items: [NewsListModel]
    private var callBack: (NewsListModel) -> Void
    
    init(items: [NewsListModel], callback: @escaping (NewsListModel) -> Void) {
        self.items = items
        self.callBack = callback
    }
    
    var body: some View {
        List(items) { item in
            NewsItemView(item: item) {
                callBack(item)
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(items: NewsListModel.testObjects) { _ in
            
        }
    }
}
