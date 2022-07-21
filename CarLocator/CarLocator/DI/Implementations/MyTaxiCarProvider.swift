//
//  MyTaxiCarProvider.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

final class MyTaxiCarProvider: CarProvider {
    var carPresenter: CarPresenter

    init(carPresenter: CarPresenter) {
        self.carPresenter = carPresenter
    }

}
