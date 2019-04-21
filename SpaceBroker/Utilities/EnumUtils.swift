//
//  EnumUtils.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

extension Array {
    func random() -> Element {
        return self[Int.random(in: 0..<count)]
    }
}
