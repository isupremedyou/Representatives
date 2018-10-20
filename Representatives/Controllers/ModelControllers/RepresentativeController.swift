//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Travis Chapman on 10/18/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

class RepresentativeController {
        
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")!
    
    static func fetchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void ) {
        
        // Create URL using components
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let stateQuery = URLQueryItem(name: "state", value: state)
        let outputQuery = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [stateQuery, outputQuery]
        
        guard let url = components?.url else {
            print("Error trying to unwrap our components URL")
            completion([])
            return
        }
        
        // Create Data Task
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error performing dataTask: \(error) || \(error.localizedDescription)")
                completion([])
                return
            } else if let data = data {
                
                let asciiDataString = String(bytes: data, encoding: .ascii)
                
                guard let fixedJsonData = asciiDataString?.data(using: .utf8) else {
                    print("Error correccting JSON data")
                    completion([])
                    return
                }
                
                do {
                    let jd = JSONDecoder()
                    let representativesDict = try jd.decode([String : [Representative]].self, from: fixedJsonData)
                    
                    let representatives = representativesDict.compactMap({ $0.value }).flatMap({ $0 })
                    DispatchQueue.main.async {
                        completion(representatives)
                    }
                } catch {
                    print("Error decoding data: \(error) || \(error.localizedDescription)")
                    completion([])
                    return
                }
            }
        }.resume()
    }
}
