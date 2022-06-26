//
//  UserViewModel.swift
//  RandomUser
//
//  Created by Harun Gunes on 26/06/2022.
//

import Foundation

struct UserViewModel {
  
  let fullName: String
  
  init(user: User) {
    self.fullName = user.name.fullName
  }
  
  
  
}
