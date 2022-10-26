//
//  File.swift
//  
//
//  Created by Shinto Joseph on 12/10/2022.
//

import Foundation
import Combine
import NetworkInfrastructure

public protocol ImageDownloadNetworkControllerProtocol {
    func getNewsImage(url: URL) -> AnyPublisher<Data, Error>
}

public class ImageDownloadNetworkController: ImageDownloadNetworkControllerProtocol {
    
    let controller: DownloadNetworkControllerProtocol
    
    public init(controller: DownloadNetworkControllerProtocol = DownloadNetworkController()) {
        self.controller = controller
    }
    
    public func getNewsImage(url: URL) -> AnyPublisher<Data, Error> {
        let request = NetworkRequest.get(url: url, headers: [:])
        return controller.download(request: request)
    }
}
