//
//  HTTPManager.swift
//  SportsTracker
//
//  Created by John Waslen on 2/28/24.
//

import Foundation

class HTTPManager : ObservableObject {
    static let shared = HTTPManager()
    
    private let key = "f7752c7b6d30c6cdb24a99f8220e1c50"
    private let hockeyLiveAddress = "https://hockey-live-sk-data.p.rapidapi.com/"
    private let rapidAPIKey = "2233943c45msha342dc777a04034p1a541ejsn970149bdb5cc"
    private let year = 2023

    
     init() {
        
    }
    func downloadGameDetail(id: String, completion: @escaping (Result<Data, Error>) -> Void){
        let constructedURL = "https://hockey-live-sk-data.p.rapidapi.com/game/\(id)?key=\(key)"
        let url = URL(string: constructedURL)
        guard let url = url else {
            completion(.failure(NSError(domain: "com.JWaslen.SportsTracker", code: 404, userInfo: [NSLocalizedDescriptionKey: "Constructed URL Failed to be Decoded! downloadGameDetailStats !"])))
            return
        }
        var request = URLRequest(url: url)
         request.httpMethod = "GET"
         
         request.allHTTPHeaderFields = [
             "X-RapidAPI-Key": rapidAPIKey,
             "X-RapidAPI-Host": "hockey-live-sk-data.p.rapidapi.com"
         ]
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                if let data = data,
                   let string = String(data: data, encoding: .utf8) {
                    print("Game Detail Response: \(string)")
                    completion(.success(data))
                    
                }
            } else {
                let error = NSError(domain: "HTTPManager", code: httpResponse.statusCode, userInfo: nil)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    func downloadStandings(league: League, completion: @escaping (Result<Data, Error>) -> Void) {
        let constructedURL = "https://hockey-live-sk-data.p.rapidapi.com/table/\(league)/\(year)?key=\(key)"
        
        let url = URL(string: constructedURL)
        guard let url = url else {
            completion(.failure(NSError(domain: "com.JWaslen.SportsTracker", code: 404, userInfo: [NSLocalizedDescriptionKey: "Constructed URL Failed to be Decoded!"])))
            return
        }
        var request = URLRequest(url: url)
         request.httpMethod = "GET"
         
         request.allHTTPHeaderFields = [
             "X-RapidAPI-Key": rapidAPIKey,
             "X-RapidAPI-Host": "hockey-live-sk-data.p.rapidapi.com"
         ]
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                if let data = data,
                   let string = String(data: data, encoding: .utf8) {
                    //print("Standings Response: \(string)")
                    completion(.success(data))
                    
                }
            } else {
                let error = NSError(domain: "HTTPManager", code: httpResponse.statusCode, userInfo: nil)
                completion(.failure(error))
            }
        }
        
        task.resume()
         
    }
    func downloadPlayerAndScheduleData(team: any Team, league: League, completion: @escaping (Result<Data, Error>) -> Void) {
        let team = team.self
        let constructedURL = "\(hockeyLiveAddress)team/\(team)/\(league.self)/\(year)?key=\(key)"
     //   let constructedURL = "https://hockey-live-sk-data.p.rapidapi.com/team/USA/WCH/2021?key=f7752c7b6d30c6cdb24a99f8220e1c50"
        
        
        let url = URL(string: constructedURL)
        guard let url = url else {
            completion(.failure(NSError(domain: "com.JWaslen.SportsTracker", code: 404, userInfo: [NSLocalizedDescriptionKey: "Constructed URL Failed to be Decoded!"])))
            return
        }
        var request = URLRequest(url: url)
         request.httpMethod = "GET"
         
         request.allHTTPHeaderFields = [
             "X-RapidAPI-Key": rapidAPIKey,
             "X-RapidAPI-Host": "hockey-live-sk-data.p.rapidapi.com"
         ]
         
         let task = URLSession.shared.dataTask(with: request) { data, response, error in
             if let error = error {
                 print("Error: \(error)")
                 return
             }
             
             guard let httpResponse = response as? HTTPURLResponse else {
                 print("Invalid response")
                 return
             }
             
             if (200...299).contains(httpResponse.statusCode) {
                 if let data = data,
                    let string = String(data: data, encoding: .utf8) {
                     //print("Response: \(string)")
                     completion(.success(data))
                     
                 }
             } else {
                 let error = NSError(domain: "HTTPManager", code: httpResponse.statusCode, userInfo: nil)
                 completion(.failure(error))
             }
         }
         
         task.resume()

    }
   
}

