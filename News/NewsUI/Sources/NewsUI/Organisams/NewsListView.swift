//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import SwiftUI
import NewsPresenter

struct NewsListView: View {
    @State var item: NewsListModel
    @ObservedObject var imageStore: NewsImagePresenter
    
    var callBack: () -> Void
    
    init(item: NewsListModel, callback: @escaping () -> Void) {
        _item = State(initialValue: item)
        imageStore = NewsImagePresenter(item: item)
        self.callBack = callback
    }
    
    var body: some View {
        HStack {
            
            ImageView(image: imageStore.image ?? UIImage(systemName: "square.and.arrow.down.on.square")!, size: CGSize(width: 44, height: 44))
            
            TextView(text: item.title)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            callBack()
        }
        .onAppear {
            imageStore.loadImage()
        }
        .onDisappear {
            imageStore.cancelLoadImage()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(item: NewsListModel.testObject) {
            print("call back")
        }
    }
}
