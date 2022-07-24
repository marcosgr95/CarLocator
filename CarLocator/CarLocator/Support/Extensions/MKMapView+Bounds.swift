//
//  MKMapView+Bounds.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 24/7/22.
//

import Foundation
import MapKit

extension MKMapView {

    var mapBounds: ((Double, Double), (Double, Double)) {
        let northWest = CGPoint(x: bounds.origin.x, y: bounds.origin.y)
        let southEast = CGPoint(x: bounds.origin.x + bounds.size.width, y: bounds.origin.y + bounds.size.height)

        let northWestCoordinates = convert(northWest, toCoordinateFrom: self)
        let southEastCoordinates = convert(southEast, toCoordinateFrom: self)

        return (
            (northWestCoordinates.latitude, northWestCoordinates.longitude),
            (southEastCoordinates.latitude, southEastCoordinates.longitude)
        )
    }
}
