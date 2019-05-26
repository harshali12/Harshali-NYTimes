//
//  NYTimes.swift
//  NYTimes
//
//  Created by APPLE on 19/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit

struct NYTimesResponse {
    var results: [NYTimes]?
    init(jsonObject : [String:AnyObject]) {
        if let result =  jsonObject[kResult] as? [[String:AnyObject]]{
            results = result.map({NYTimes(jsonObject:$0)})
        }
    }
}

struct NYTimes {
    var abstract: String = ""
    var byline: String = ""
    var created_date: String
    var des_facet: [String]
    //var geo_facet: [String]
//    var item_type: String
//    var kicker: String
//    var material_type_facet: String
//    var org_facet: String
//    var published_date: String
//    var section: String
//    var short_url: String
//    var subsection: String
      var title: String
//    var updated_date: String
//    var url: String
//    var per_facet: [String]
    var multimedia: [Multimedia]?
    init(jsonObject : [String : AnyObject]) {
        abstract = jsonObject["abstract"] as? String ?? ""
        byline = jsonObject["byline"] as? String ?? ""
        created_date = jsonObject ["created_date"] as? String ?? ""
        title = jsonObject ["created_date"] as? String ?? ""
        des_facet = jsonObject ["des_facet"] as? [String] ?? [""]
        if let picture =  jsonObject["multimedia"] as? [[String:AnyObject]]{
            multimedia = picture.map({Multimedia(jsonObject:$0)})
        }
    }

}

struct Multimedia {
    var caption: String = ""
    var copyright: String = ""
    var format: String = ""
    var height: Int = 0
    var subtype: String = ""
    var type: String = ""
    var url: String = ""
    var width: Int = 0
    init(jsonObject : [String : AnyObject]) {
        caption = jsonObject["caption"] as? String ?? ""
        copyright = jsonObject["copyright"] as? String ?? ""
        height = jsonObject ["height"] as? Int ?? 0
        subtype = jsonObject ["subtype"] as? String ?? ""
        url = jsonObject ["url"] as? String ?? ""
        width = jsonObject ["width"] as? Int ?? 0

    }
}



