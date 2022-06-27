//
//  SearchView.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 23/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var make: String = ""
    @State private var model: String = ""
    @State private var year: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextField("Make", text: $make)
                        .disableAutocorrection(true)
                        .padding()
                        .border(.primary)
                    TextField("Model", text: $model)
                        .disableAutocorrection(true)
                        .padding()
                        .border(.primary)
                    TextField("Year", text: $year)
                        .padding()
                        .border(.primary)
                    Button("Search") {
                        // Do something
                    }.buttonStyle(.borderedProminent)
                }
            }.padding()
                .navigationTitle("Find a car...")
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
