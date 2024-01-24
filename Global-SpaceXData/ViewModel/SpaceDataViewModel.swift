//
//  SpaceDataViewModel.swift
//  Global-SpaceXData
//
//  Created by Sameer Kupkar on 23/01/24.
//


import Foundation

class SpaceDataViewModel {
    
    var summaryModel = [SummaryModel]()
    
    private let sourcesURL = URL(string: "https://api.spacexdata.com/v3/launches")!

    func apiToGetSpaceData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let spaceData = try! jsonDecoder.decode(Array<SummaryModel>.self, from: data)
                self?.summaryModel = spaceData
                completion()
            }
        }.resume()
    }
}
