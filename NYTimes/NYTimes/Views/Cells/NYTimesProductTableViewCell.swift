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
    
    func configureItemsCell(viewModel:NYTimesViewModel, indexPath:IndexPath) {
        titleLabel.text = viewModel.getTitle(indexPath: indexPath)
        abstractDateLabel.text = viewModel.getAbstract(indexPath: indexPath)
        let imageURL = viewModel.getProductImageURL(indexPath: indexPath)
        productImage.sd_setImage(with: URL(string:imageURL), placeholderImage: nil, options: .refreshCached, completed: { (image, error, type, url) in
            if image != nil {
                self.productImage.image = image
            }
        })
 
    }
    
}
