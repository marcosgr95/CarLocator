//
//  Constants.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

struct Storyboards {
    static let CarListViewController = "CarListViewController"
}

struct Coordinates {
    static let hamburgNorthWest: (Double, Double) = (53.694865, 9.757589)
    static let hamburgSouthEast: (Double, Double) = (53.394655, 10.099891)
}

struct QueryParams {
    static let nwLat = "p1Lat"
    static let nwLon = "p1Lon"
    static let seLat = "p2Lat"
    static let seLon = "p2Lon"
}
