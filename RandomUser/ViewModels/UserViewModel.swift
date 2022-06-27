//
//  UserViewModel.swift
//  RandomUser
//
//  Created by Harun Gunes on 26/06/2022.
//

import UIKit

struct UserViewModel {
  
  let fullName: String
  let avatarURL: String
  let gender: String
  let nationality: String
  let phoneNumber: String
  let emailAddress: String
  let address: String
  let latitude: Double
  let longitude: Double
  
  
  init(user: User) {
    self.fullName = "\(user.name.first) \(user.name.last)"
    self.avatarURL = user.picture.large
    self.gender = user.gender
    self.nationality = user.nat
    self.phoneNumber = user.phone
    self.emailAddress = user.email
    self.address = "\(user.location.street.name) \(user.location.street.number), \(user.location.city), \(user.location.state) | \(user.location.country)"
    self.latitude = Double(user.location.coordinates.latitude)!
    self.longitude = Double(user.location.coordinates.longitude)!
  }
  
}
