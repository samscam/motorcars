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
        VStack(alignment: .leading){
            HStack{
                Text("Searching for: ")
                Text(searchParameters.make).bold()
                Text(searchParameters.model).bold()
                Text(searchParameters.year)
            }
            if viewModel.isSearching{
                Group{
                    Text("Searching!")
                }
            }
            
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let searchParams = SearchParameters(make: "Dacia", model: "Sandero", year: "2014")
        ResultsView(searchParams)
    }
}

