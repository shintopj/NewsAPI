//
//  NewsTableViewCell.swift
//  
//
//  Created by Shinto Joseph on 14/10/2022.
//

import UIKit
import Combine
import NewsPresenter

public class NewsTableViewCell: BaseTableViewCell<NewsListModel> {

    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    var presenter: NewsImagePresenter?
    private var cancellables = Set<AnyCancellable>()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
            // Configure the view for the selected state
    }
    
    public override var item: NewsListModel? {
        didSet {
            
            if let item = item {
                presenter = NewsImagePresenter(item: item, cache: ImageCache.shared)
                sinkImage()
                presenter?.loadImage()
            }
            
            if let title = item?.title {
                self.lblText.text = title
                self.lblText.sizeToFit()
            }
            
                //            if let body = item?.ima {
                //                self.lblBody?.text = body
                //            }
        }
    }
    
    private func sinkImage() {
        
        presenter?.$image.sink { [weak self] newImage in
            self?.imgNews.image = newImage ?? UIImage(systemName: "square.and.arrow.down.on.square")!
        }
        .store(in: &cancellables)
    }
    
    public override func prepareForReuse() {
        presenter?.cancelLoadImage()
    }
}
