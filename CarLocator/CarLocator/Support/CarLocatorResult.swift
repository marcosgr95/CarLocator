//
//  CarLocatorResult.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 22/7/22.
//

import Foundation

struct CarLocatorResult<T: Decodable>: Decodable {
    var resultsList: T?

    enum CodingKeys: String, CodingKey {
        case poiList
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultsList = try values.decode(T.self, forKey: .poiList)
    }
}
