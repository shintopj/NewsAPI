//
//  UITableView+Extension.swift
//  NewsAPI
//
//  Created by Shinto Joseph on 03/12/2019.
//  Copyright © 2019 Shinto Joseph. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableTableViewCell {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableTableViewCell, T: NibLoadableTableViewCell {
//        let bundle = Bundle(for: T.self)
//        let bundle = Bundle(for: Bu)
        let nib = UINib(nibName: T.nibName, bundle: Bundle.module)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableTableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
