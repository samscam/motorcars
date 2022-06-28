//
//  SearchView.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 23/06/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{

            ScrollView{

                VStack{
                    TextField("Make", text: $viewModel.make)
                        .disableAutocorrection(true)
                        .padding()
                        .border(.primary)
                    TextField("Model", text: $viewModel.model)
                        .disableAutocorrection(true)
                        .padding()
                        .border(.primary)
                    TextField("Year", text: $viewModel.year)
                        .padding()
                        .border(.primary)
                    NavigationLink(destination: ResultsView(viewModel: viewModel.resultsViewModel)) { Text("Search")
                    }
                        .buttonStyle(.borderedProminent)
                }
            }
                .padding()
                .navigationTitle("Find a car...")
        }.navigationViewStyle(.stack)

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
