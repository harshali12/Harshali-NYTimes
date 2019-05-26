//
//  NYTimesViewModel.swift
//  NYTimes
//
//  Created by APPLE on 20/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class NYTimesViewModel {
    
    private var product = [NYTimes]()
    private var pageNumer = 0
    private var isLoading = false
    private var isPaging = false
    init() {}
}
extension NYTimesViewModel {

    func getNYTimesProduct(completion: @escaping () -> Void) {
       // CustomLoader.showActivityView(view: NYTimesListingViewController().view)
        STWebService.shared.fetchNYTimesItems(completionHandler: {
            (statusCode, response , error) in
            if statusCode == 200 {
                if let data = response?[kResult] as? [[String:AnyObject]] {
                    let productData = data.map({NYTimes(jsonObject :$0 as [String : AnyObject])})
                    self.product = productData
                    completion()
                }
                else {
                    CustomLoader.removeActivityIndicator(NYTimesListingViewController().view)
                }
            } else {
                CustomLoader.showActivityView(view: NYTimesListingViewController().view)
            }
            CustomLoader.showActivityView(view: NYTimesListingViewController().view)
        })
    }
  
}
//MARK: data binding logic
extension NYTimesViewModel {
    
    func getNumberOfSection() ->Int {
        return 1
    }
    
    func getNumberOfRowForSection(section:Int) -> Int {
        return product.count
    }
    
}
//MARK: News data getter methods
extension NYTimesViewModel {
    func getTitle(indexPath:IndexPath) -> String {
        return product[indexPath.row].title 
    }
    
    func getAbstract(indexPath:IndexPath) -> String {
        return product[indexPath.row].abstract 
    }
    
    func getProductImageURL(indexPath:IndexPath) -> String {
        var multimedia = product[indexPath.row].multimedia
        return multimedia?[0].url ?? ""
    }
}
