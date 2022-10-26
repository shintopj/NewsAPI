//
//  File.swift
//  
//
//  Created by Shinto Joseph on 14/10/2022.
//

import UIKit

extension UIImage {
    
        // Mascot
    static var loading: UIImage? {
        return UIImage(systemName: "square.and.arrow.down.on.square")
    }
    
    static var noData: UIImage? {
        return UIImage(named: "tray")
    }
    
    static var noNetwork: UIImage? {
        return UIImage(named: "wifi.exclamationmark")
    }
    
    static var error: UIImage? {
        return UIImage(named: "exclamationmark.triangle")
    }
}
