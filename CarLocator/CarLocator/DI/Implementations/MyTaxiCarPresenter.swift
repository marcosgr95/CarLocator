//
//  MyTaxiCarPresenter.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

final class MyTaxiCarPresenter: CarPresenter {

    weak var carViewController: CarViewController?

    func setView(_ view: CarViewController) {
        carViewController = view
    }

    func presentCars(_ carResult: CarLocatorResult<[Car]>) {
        carViewController?.displayCars(
            carResult.resultsList?
                .compactMap{ CarViewModel(
                    active: $0.state == CarState.active.rawValue,
                    location: ($0.coordinate.latitude, $0.coordinate.longitude),
                    type: $0.type)
                } ?? []
        )
    }
}
