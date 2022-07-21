//
//  App.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

func injectApp() -> App { AppInjector.shared.app }

protocol App {
    var carProvider: CarProvider { get }
}
