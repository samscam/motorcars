//
//  Vehicle.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import Foundation

struct Vehicle: Decodable, Identifiable{
    var id: String
    var name: String
    var title: String
    var make: String
    var model: String
    var year: String
    var price: String
}

struct VehicleResponse: Decodable{
    let searchResults: [Vehicle]
}
