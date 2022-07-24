//
//  String+Car.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import Foundation

extension String {
    init(type: String, location: (Double, Double)) {
        var carType: String?
        switch type {
        case CarType.taxi.rawValue:
            carType = "🚕 Taxi"
        default:
            carType = "🚗 Other"
        }

        self = "\(carType ?? ""), (\(location.0.toThreeDecimalsString), \(location.1.toThreeDecimalsString))"
    }

}
