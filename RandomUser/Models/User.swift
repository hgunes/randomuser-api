//
//  User.swift
//  RandomUser
//
//  Created by Harun Gunes on 15/02/2022.
//

import Foundation

struct UserResult: Decodable {
  let results: [User]
}

struct User: Decodable {
  var name: Name
  var gender: String
  var email: String
  var phone: String
  var picture: Picture
  var nat: String
  var location: Location
}

struct Name: Decodable {
  var first: String
  var last: String
  
  var fullName: String {
    let fullName = "\(first) \(last)"
    return fullName
  }
}

struct Picture: Decodable {
  var large: String
}

struct Location: Decodable {
  var coordinates: Coordinates
}

struct Coordinates: Decodable {
  var latitude: String
  var longitude: String
}
