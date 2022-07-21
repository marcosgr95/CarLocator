//
//  AppModule.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

final class AppModule: App {

    var carProvider: CarProvider = MyTaxiCarProvider(carPresenter: MyTaxiCarPresenter())

}
