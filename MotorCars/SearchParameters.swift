//
//  SearchParameters.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import Foundation

struct SearchParameters: Encodable {
    var make: String
    var model: String
    var year: String
}
