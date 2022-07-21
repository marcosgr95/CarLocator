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
}
