//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation
import SystemConfiguration

enum Timeout: TimeInterval {
    case short = 10
    case medium = 30
    case long = 60
}

public class BaseNetworkConnection: NSObject {

    func networkAvailable() -> Bool {
        
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAddress.sa_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        ) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        guard SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags)
        else {
            return false
        }
        
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
}
