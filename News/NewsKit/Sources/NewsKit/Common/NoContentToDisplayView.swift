//
//  NoContentToDisplayView.swift
//  NewsAPI
//
//  Created by Shinto Joseph on 24/09/2020.
//  Copyright © 2020 Shinto Joseph. All rights reserved.
//

import UIKit

class NoContentToDisplayView: UIView {
    
    let imageView = UIImageView()
    let label = UILabel()
    let spinner = UIActivityIndicatorView(style: .large)
    
    var state: UIState? {
        didSet {
            label.text = self.state?.message ?? Strings.noData
            imageView.image = self.state?.image
            
            if state?.status == .loading {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightText
           
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.textColor = .darkText
        label.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [imageView, spinner, label])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Auto layout
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -32),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            spinner.heightAnchor.constraint(equalToConstant: 30),
            spinner.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
