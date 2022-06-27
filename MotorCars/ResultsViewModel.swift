//
//  ResultsViewModel.swift
//  MotorCars
//
//  Created by Sam Easterby-Smith on 27/06/2022.
//

import Foundation
import Alamofire

extension ResultsView{
    @MainActor class ViewModel: ObservableObject{
        
        private let searchParameters: SearchParameters
        private let baseURL = "https://mcuapi.mocklab.io/search"
        
        @Published var isSearching: Bool = true
        @Published var errorDescription: String?
        @Published var vehicles: [Vehicle]?
        
        init(_ searchParameters: SearchParameters){
            self.searchParameters = searchParameters
        }
        
        func executeSearch() {
            isSearching = true
            AF.request(baseURL, method: .get, parameters: searchParameters).responseDecodable(of: VehicleResponse.self){ [weak self] response in
                
                self?.isSearching=false
                debugPrint(response)
                switch response.result {
                case .failure(let error):
                    self?.errorDescription = error.localizedDescription
                case .success(let vehicleResponse):
                    self?.vehicles = vehicleResponse.searchResults
                }
                
            }
        }
        
    }
}

