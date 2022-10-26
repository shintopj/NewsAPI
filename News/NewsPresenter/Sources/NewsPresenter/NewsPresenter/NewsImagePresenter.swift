//
//  File.swift
//  
//
//  Created by Shinto Joseph on 12/10/2022.
//

import Combine
import SwiftUI
import NewsInfrastructure

public class NewsImagePresenter: ObservableObject {
    
    @Published public var image: UIImage?
    
    private var item: NewsListModel
    private var cache: ImageCache
    
    private var cancellable: AnyCancellable?
    
    public init(item: NewsListModel, cache: ImageCache = ImageCache.shared) {
        self.item = item
        self.cache = cache
        
        if let url = item.url {
            if let img = cache.image(url: url) {
                image = img
            }
        }
    }
    
    public func loadImage() {
        
        if let urlString = item.url {
            
            if let img = cache.image(url: urlString) {
                image = img
            } else if let url = URL(string: urlString) {
                
                cancellable = ImageDownloadNetworkController()
                    .getNewsImage(url: url)
                    .mapError{ error -> Error in
                        return error
                    }
                    .sink(receiveCompletion: { _ in
                        
                    }, receiveValue: { [weak self] in
                        if let img = UIImage(data: $0) {
                            self?.image = img
                            self?.cache.saveImage(url: urlString, image: img)
                        }
                        
                    }
                    )
            }
        }
    }
    
    public func cancelLoadImage() {
        cancellable?.cancel()
    }
    
}


