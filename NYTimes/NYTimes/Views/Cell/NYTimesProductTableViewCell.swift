//
//  NYTimesProductTableViewCell.swift
//  NYTimes
//
//  Created by APPLE on 19/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import UIKit

class NYTimesProductTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var abstractDateLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureNewsCell(viewModel:NYTimesViewModel, indexPath:IndexPath) {
        titleLabel.text = viewModel.getTitle(indexPath: indexPath)
        abstractDateLabel.text = viewModel.getAbstract(indexPath: indexPath)
        
//        newsImage.sd_setImage(with: URL(string:imageURL), placeholderImage: #imageLiteral(resourceName: "preview"), options: .refreshCached, completed: { (image, error, type, url) in
//            if image != nil {
//                self.newsImage.image = image
//            }
//        })
    }
    
}
