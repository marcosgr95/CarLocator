//
//  Bool+Activeness.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import Foundation

extension Bool {
    init(string: String) {
        self.init(booleanLiteral: string == CarState.active.rawValue)
    }

    var toActivenessString: String {
        return self ? CarState.active.rawValue : CarState.inactive.rawValue
    }
}
