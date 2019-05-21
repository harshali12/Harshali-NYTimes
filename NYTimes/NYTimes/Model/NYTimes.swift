//
//  NYTimes.swift
//  NYTimes
//
//  Created by APPLE on 19/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit

struct NYTimesResponse: Decodable {
    var results: [NYTimes]?
}

struct NYTimes: Decodable {
    var abstract: String?
    var byline: String?
    var created_date: String?
    var des_facet: [String]?
    var geo_facet: [String]?
    var itemType: String?
    var kicker: String?
    var material_type_facet: String?
    var published_date: String?
    var section: String?
    var short_url: String?
    var subsection: String?
    var title: String?
    var updated_date: String?
    var url: String
}




