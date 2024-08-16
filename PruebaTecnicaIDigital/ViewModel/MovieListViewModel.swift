//
//  MovieListViewModel.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var movies:[MovieDataModel] = []
 
    
    func fetchMovies() {
        let urlString = "\(Constansts.MainURL.main)?api_key=\(Constansts.ApiKey.key)&query=AVENGERS"
        
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
    
        NetworkManager.shared.fetchData(from: url, responseType: MovieResponseDataModel.self) { [weak self] response, error in
         
            if let error = error {
                print("Ocurrió un : \(error.localizedDescription)")
                return
            }
            
            if let response = response {
                self?.movies = response.results?.filter{ $0.adult == false } ?? []
                
            }
        }
    }
}
