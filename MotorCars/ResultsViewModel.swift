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
        
        enum ResultsViewState {
            case searching
            case error(Error)
            case success([Vehicle])
        }
        
        private let searchParameters: SearchParameters
        private let baseURL = "https://mcuapi.mocklab.io/search"
        
        @Published var state: ResultsViewState = .searching
        
        init(_ searchParameters: SearchParameters){
            self.searchParameters = searchParameters
        }
        
        func executeSearch() {
            state = .searching
            
            AF.request(baseURL, method: .get, parameters: searchParameters).responseDecodable(of: VehicleResponse.self){ [weak self] response in
                
                // Logging out these responses
                debugPrint(response)
                
                switch response.result {
                case .failure(let error):
                    self?.state = .error(error)
                case .success(let vehicleResponse):
                    self?.state = .success(vehicleResponse.searchResults)
                }
                
            }
        }
        
    }
}

