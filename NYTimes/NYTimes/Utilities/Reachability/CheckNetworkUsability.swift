//
//  CheckNetworkUsability.swift
//  NYTimes
//
//  Created by APPLE on 27/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation

class CheckNetworkUsability : NSObject{
    
    static var instance : CheckNetworkUsability!
    var reachability: Reachability = Reachability.forInternetConnection()
    class func sharedInstance() -> CheckNetworkUsability{
        
        self.instance =  (self.instance ?? CheckNetworkUsability())
        self.instance.reachability.startNotifier()
        return self.instance
    }
    override init(){
        
        super.init()
        
    }
    
    /**
     * This function checks status of Internet Connection.
     * - Returns: checkInternetConnection in Bool format
     */
    func checkInternetConnection() -> Bool{
        
        return reachability.currentReachabilityStatus() == NotReachable ? false : true
        
    }
    
}
