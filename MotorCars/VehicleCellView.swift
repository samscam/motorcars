//
//  VehicleCellView.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import SwiftUI

struct VehicleCellView: View {
    var vehicle: Vehicle
    var body: some View {
        VStack{
            Text(vehicle.title).bold()
            Text(vehicle.name)
            HStack{
                Text(vehicle.make)
                Text(vehicle.model)
                Text(vehicle.year)
            }
            Text(vehicle.price)
        }
    }
}

struct VehicleCellView_Previews: PreviewProvider {
    static var previews: some View {
        let vehicle = Vehicle(id: "123", name: "Dacia", title: "A basic car", make: "Dacia", model: "Sandero", year: "2015", price: "£679")
        VehicleCellView(vehicle: vehicle)
    }
}
