//
//  Injector.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

final class AppInjector {

    private static var _shared: Injector!

    static var shared: Injector {
        guard let _shared = _shared else {
            fatalError("You have to call initialize(_ injector: Injector) before accessing AppInjector.shared")
        }
        return _shared
    }

    static func initialize(_ injector: Injector) {
        _shared = injector
    }

    final class Injector {

        private(set) var app: App

        init(_ app: App) {
            self.app = app
        }
    }
}
