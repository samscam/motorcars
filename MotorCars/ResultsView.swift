//
//  ResultsView.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import SwiftUI

struct ResultsView: View {
    let searchParameters: SearchParameters
    @ObservedObject private var viewModel: ViewModel
    
    init(_ searchParameters: SearchParameters){
        self.searchParameters = searchParameters
        self.viewModel = ViewModel(searchParameters)
    }
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Text("Searching for: ")
                    Text(searchParameters.make).bold()
                    Text(searchParameters.model).bold()
                    Text(searchParameters.year)
                }
                if viewModel.isSearching {
                    ProgressView("Searching")
                }
                
                if let vehicles = viewModel.vehicles {
                    
                    // I've done this as a straight ForEach - which would be non-ideal if we have many results here.
                    // ... but also we would want paging and all sorts of other stuff going on if there were to be many many results...
                    
                    ForEach(vehicles){ vehicle in
                        VehicleCellView(vehicle: vehicle)
                    }
                }
            }.padding()
        }
        .navigationTitle("Results")
        .onAppear(){
            viewModel.executeSearch()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let searchParams = SearchParameters(make: "Dacia", model: "Sandero", year: "2014")
        ResultsView(searchParams)
    }
}

