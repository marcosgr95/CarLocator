//
//  Car.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 22/7/22.
//

import Foundation

struct Car: Decodable {
    let id: Int
    let coordinate: CarCoordinate
    let state: String
    let type: String

    struct CarCoordinate: Decodable {
        let latitude: Double
        let longitude: Double
    }
}
