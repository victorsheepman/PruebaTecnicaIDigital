//
//  NetworkManager.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func fetchData<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let noDataError = NSError(domain: "No Data", code: 0, userInfo: nil)
                completion(nil, noDataError)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(responseType, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
