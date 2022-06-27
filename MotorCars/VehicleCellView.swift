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
            HStack{
                VStack(alignment: .leading){
                    Text(vehicle.title).font(.title2).bold()
                    Text(vehicle.name).font(.title2)
                }
                Spacer()
                
            }
            HStack(){
                Spacer()
                Text(vehicle.price)
                    .font(.title)
                    .bold()
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(.red)
                    .rotationEffect(.degrees(-5))
            }
        }.padding()
        .background(.quaternary)
    }
}

struct VehicleCellView_Previews: PreviewProvider {
    static var previews: some View {
        let vehicle = Vehicle(id: "123", name: "Dacia", title: "A basic car", make: "Dacia", model: "Sandero", year: "2015", price: "£679")
        VehicleCellView(vehicle: vehicle)
            .preferredColorScheme(.dark)
    }
}
