//
//  EnumUtils.swift
//  SpaceTrader
//
//

import Foundation

extension Array {
    func random() -> Element {
        return self[Int.random(in: 0..<count)]
    }
}
