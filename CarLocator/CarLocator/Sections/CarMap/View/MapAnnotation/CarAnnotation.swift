//
//  CarAnnotation.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 24/7/22.
//

import UIKit
import MapKit

class CarAnnotation: NSObject, MKAnnotation {

    static let clusteringIdentifier: String = "CarAnnotationCluster"
    static let identifier: String = "CarAnnotation"

    let coordinate: CLLocationCoordinate2D
    let title: String?

    init(coordinate: CLLocationCoordinate2D, title: String, type: String) {
        self.coordinate = coordinate
        self.title = title
    }

}
