//
//  NetworkManager.swift
//  Neno-Asessment-MarkA
//
//  Created by Mark Alford on 3/15/23.
//

import Foundation
import SwiftUI

/// Simple Network Manager to handle api call
class NetworkManager: ObservableObject {
    @Published var data = [Datum]()
    @Published var count = 10
    
    init() {
        updateData()
    }
    
    func updateData() {
        let url = "https://fakerapi.it/api/v1/persons?_quantity=\(count)&_gender=male"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, response, error in
            if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                
                let json = try  JSONDecoder().decode(PeopleModel.self, from: data)
                let oldData = self.data
                DispatchQueue.main.async {
                    self.data = oldData + json.data
                }
            } catch {
                
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

