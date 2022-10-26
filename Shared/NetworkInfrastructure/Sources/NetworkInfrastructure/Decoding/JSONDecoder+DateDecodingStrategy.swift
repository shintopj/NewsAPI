//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

public let kDateFormatYYYYMMDDT = "yyyy-MM-dd'T'HH:mm:ss"
public let kDateFormatYYYYMMDDSSS = "yyyy-MM-dd'T'HH:mm:ss.SSS"
public let kDateFormatYYYYMMDDZ = "yyyy-MM-dd'T'HH:mm:ssZ"

extension JSONDecoder.DateDecodingStrategy {
    public static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = DateFormatter.iso8601Full.date(from: string) ?? DateFormatter.iso8601withFractionalSeconds.date(from: string) ?? DateFormatter.iso8601FullZ.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = kDateFormatYYYYMMDDT
        formatter.calendar = Calendar(identifier: .iso8601)
            //        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.timeZone = TimeZone(identifier: "GMT+2")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let iso8601withFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "GMT+2")
        formatter.dateFormat = kDateFormatYYYYMMDDSSS
        return formatter
    }()
    
    static let iso8601FullZ: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "GMT+2")
        formatter.dateFormat = kDateFormatYYYYMMDDZ
        return formatter
    }()
    
}

