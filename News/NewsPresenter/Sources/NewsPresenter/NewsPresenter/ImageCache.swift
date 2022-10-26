//
//  File.swift
//  
//
//  Created by Shinto Joseph on 12/10/2022.
//

import Foundation
import UIKit

public final class ImageCache {
    public static let shared = ImageCache()
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    func image(url: String) -> UIImage? {
        
        if let url = NSURL(string: url) {
            return cachedImages.object(forKey: url)
        }
        return nil
    }
    
    func saveImage(url: String, image: UIImage) {
        if let url = NSURL(string: url) {
            self.cachedImages.setObject(image, forKey: url)
        }
    }
}
