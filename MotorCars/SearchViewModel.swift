//
//  SearchViewModel.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import Foundation

extension SearchView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var make: String = ""
        @Published var model: String = ""
        @Published var year: String = ""
        
        var searchParameters: SearchParameters {
            return SearchParameters(make: make, model: model, year: year)
        }
        
        var resultsViewModel: ResultsView.ViewModel {
            let viewModel = ResultsView.ViewModel()
            viewModel.searchParameters = searchParameters
            return viewModel
        }
    }
}
