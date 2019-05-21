//
//  JsonCoder.swift
//  NYTimes
//
//  Created by APPLE on 20/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
extension Decodable {
    
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

//: Encodable Extension

extension Encodable {
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}
