//
//  URLQueryItem+Hamburg.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import Foundation

extension URLQueryItem {
    static var hamburgCoordinatesAsURLQueryItems: [URLQueryItem] {
        let (nwLat, nwLon) = Coordinates.hamburgNorthWest
        let (seLat, seLon) = Coordinates.hamburgSouthEast
        return [
            URLQueryItem(name: QueryParams.nwLat, value: "\(nwLat)"),
            URLQueryItem(name: QueryParams.nwLon, value: "\(nwLon)"),
            URLQueryItem(name: QueryParams.seLat, value: "\(seLat)"),
            URLQueryItem(name: QueryParams.seLon, value: "\(seLon)")
        ]
    }
}
