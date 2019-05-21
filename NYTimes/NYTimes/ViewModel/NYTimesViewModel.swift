//
//  NYTimesViewModel.swift
//  NYTimes
//
//  Created by APPLE on 20/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit

class NYTimesViewModel {
    
    private var product = [NYTimes]()
    private var pageNumer = 0
    private var isLoading = false
    private var isPaging = false
    init() {}
}
//MARK: GetNews : Web Service & Pagination Calls
extension NYTimesViewModel {
    
    func getNYTimesProduct(completion: @escaping () -> Void) {
        
        STWebService.shared.fetchNYTimesItems() { (response) in
            if let data = response.results , data.count > 0 {
                self.product += data
            }
            completion()
        }
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
        return product[indexPath.row].title ?? ""
    }
    
    func getAbstract(indexPath:IndexPath) -> String {
        return product[indexPath.row].abstract ?? ""
    }

}
