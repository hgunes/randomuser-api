//
//  NetworkManager.swift
//  RandomUser
//
//  Created by Harun Gunes on 15/02/2022.
//

import Foundation


class NetworkManager {
  
  static let shared = NetworkManager()
  let baseUrl = "https://randomuser.me/api/?results=10"
  
  
  private init() {}
  
  
  func fetchUsers(completed: @escaping (Result<[User], RUError>) -> Void) {
    
    guard let url = URL(string: baseUrl) else {
      completed(.failure(.urlError))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(.failure(.taskError))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.responseError))
        return
      }
      
      guard let data = data else {
        completed(.failure(.dataError))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let results = try decoder.decode(UserResult.self, from: data)
        let users = results.results
        completed(.success(users))
      } catch {
        completed(.failure(.decodingError))
      }
    }
    task.resume()
  }
}
