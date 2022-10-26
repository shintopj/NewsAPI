//
//  File.swift
//  
//
//  Created by Shinto Joseph on 13/10/2022.
//

import UIKit

public enum Status {
    case error, noError, noNetwork, noData, loading
}

class UIState: ObservableObject {
    var status: Status = .loading
    var message: String = Strings.loading
    var image: UIImage? = UIImage.loading
    
    init(status: Status, message: String = Strings.loading) {
        self.status = status
        self.message = message
    }
    
    init(status: Status, message: String, image: UIImage) {
        self.status = status
        self.message = message
        self.image = image
    }
    
    func update(status: Status) {
        self.update(status: status, message: "")
    }
    
    func update(status: Status, message: String) {
        self.status = status
        if status == .loading {
            self.image = UIImage.loading
            self.message = message.lengthOfBytes(using: .utf8) > 0 ? message : Strings.loading
        } else if status == .noNetwork {
            self.image = UIImage.noNetwork
            self.message = message.lengthOfBytes(using: .utf8) > 0 ? message : Strings.noNetwork
        } else if status == .error {
            self.image = UIImage.error
            self.message = message.lengthOfBytes(using: .utf8) > 0 ? message : Strings.applicationError
        } else {
            self.image = UIImage.noData
            self.message = message.lengthOfBytes(using: .utf8) > 0 ? message : Strings.noData
        }
    }
}
