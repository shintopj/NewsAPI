//
//  BaseTableViewCell.swift
//  NewsAPI
//
//  Created by Shinto Joseph on 08/12/2019.
//  Copyright © 2019 Shinto Joseph. All rights reserved.
//

import UIKit

public class BaseTableViewCell<V>: UITableViewCell {
    open var item: V!
}

extension BaseTableViewCell: NibLoadableTableViewCell, ReusableTableViewCell { }
