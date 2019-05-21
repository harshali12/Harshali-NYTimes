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
 
    }
    
}
