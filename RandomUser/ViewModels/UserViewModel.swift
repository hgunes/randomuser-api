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
  
  init(user: User) {
    self.fullName = "\(user.name.first) \(user.name.last)"
    self.avatarURL = user.picture.large
    self.gender = user.gender
    self.nationality = user.nat
  }
  
}
