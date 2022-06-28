//
//  ResultsView.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import SwiftUI

struct ResultsView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                if let searchParameters = viewModel.searchParameters {
                    HStack{
                        Text("Searching for: ")
                        Text(searchParameters.make).bold()
                        Text(searchParameters.model).bold()
                        Text(searchParameters.year)
                    }
                }
                switch viewModel.state {
                case .searching:
                    ProgressView("Searching")
                case .success(let vehicles):
                    // I've done this as a straight ForEach - which would be non-ideal if we have many results here.
                    // ... but also we would want paging and all sorts of other stuff going on if there were to be many many results...
                    
                    ForEach(vehicles){ vehicle in
                        VehicleCellView(vehicle: vehicle)
                    }
                case .error(let error):
                    VStack{
                    Text("ERROR!").font(.title)
                        Text(error.localizedDescription)
                    }.padding().background(.red)
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
    static let searchParams = SearchParameters(make: "Dacia", model: "Sandero", year: "2014")
    
    static var searchingViewModel: ResultsView.ViewModel {
        let vm = ResultsView.ViewModel()
        vm.state = .searching
        return vm
    }
    
    static var errorViewModel: ResultsView.ViewModel {
        let vm = ResultsView.ViewModel()
        vm.state = .error(FakeError.somethingNasty)
        return vm
    }
    
    static var successViewModel: ResultsView.ViewModel {
        let vm = ResultsView.ViewModel()
        let vehicles = [
        Vehicle(id: "123", name: "Bikes are better", title: "LHT", make: "Surly", model: "Long Haul Trucker", year: "2014", price: "£689.00")
        ]
        vm.state = .success(vehicles)
        return vm
    }
    
    
    static var previews: some View {
        Group{
            ResultsView(viewModel: searchingViewModel)
            ResultsView(viewModel: errorViewModel)
            ResultsView(viewModel: successViewModel)
        }
    }
}

enum FakeError: Error {
    case somethingNasty
}
