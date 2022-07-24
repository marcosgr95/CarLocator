//
//  Constants.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

enum CarState: String {
    case active = "ACTIVE"
    case inactive = "INACTIVE"
}

enum CarType: String {
    case taxi = "TAXI"
}

struct CustomCells {
    static let CarListTableViewCell = "CarListTableViewCell"
}

struct Coordinates {
    static let defaultRadius: Double = 1_000
    static let hamburgNorthWest: (Double, Double) = (53.694865, 9.757589)
    static let hamburgSouthEast: (Double, Double) = (53.394655, 10.099891)
    static let hamburgCenter: (Double, Double) = (53.551086, 9.993682)
}

struct ErrorMessages {
    static let generic: String = "There was an unexpected error. Try again later."
    static let serverError: String = "The server seems to be unreachable at the moment or something went wrong. Try again later."
}

struct QueryParams {
    static let nwLat = "p1Lat"
    static let nwLon = "p1Lon"
    static let seLat = "p2Lat"
    static let seLon = "p2Lon"
}

struct Storyboards {
    static let CarListViewController = "CarListViewController"

    struct EmbeddedVC {
        static let CarListNavigationViewController = "CarListNVC"
    }
}
