//
//  SwiftUIView.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import SwiftUI
import NewsPresenter

public struct NewDetailsPageView: View {
    var item: NewsDetailsModel
    @ObservedObject var imageStore: NewsImagePresenter
    
    public init(item: NewsDetailsModel) {
        self.item = item
        imageStore = NewsImagePresenter(item: NewsListModel(title: item.title, url: item.urlToImage))
    }
    
    public var body: some View {
        VStack {
            Text(item.author)
                .font(.footnote)
            Text(item.publishedAt)
                .font(.footnote)
            
            Divider()
            
            Text(item.title)
                .font(.headline)
            
            ImageView(image: imageStore.image ?? UIImage(systemName: "square.and.arrow.down.on.square")!, size: CGSize(width: 250, height: 250))
            
//            if let url = item.urlToImage {
//                
//                if #available(iOS 15.0, *) {
//                    AsyncImage(url: URL(string: url)) { image in
//                        image.resizable()
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    .frame(width: 250, height: 250)
//                } else {
//                        // Fallback on earlier versions
//                    
//                }
//                
//            }
            
            Divider()
            
            Text(item.content)
                .font(.subheadline)
        }
        .onAppear {
            imageStore.loadImage()
        }
        .onDisappear {
            imageStore.cancelLoadImage()
        }
        .padding()
    }
}

struct NewDetailsPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailsPageView(item: NewsDetailsModel.testObject)
    }
}
