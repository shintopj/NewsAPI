//
//  TableViewCellRegisterAndReuseProtocol.swift
//  NewsAPI
//
//  Created by Shinto Joseph on 03/12/2019.
//  Copyright © 2019 Shinto Joseph. All rights reserved.
//

import UIKit

public protocol ReusableTableViewCell: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableTableViewCell where Self: UITableViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol NibLoadableTableViewCell: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableTableViewCell where Self: UITableViewCell {
    public static var nibName: String {
        return String(describing: self)
    }
}
