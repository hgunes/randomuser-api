//
//  RUError.swift
//  RandomUser
//
//  Created by Harun Gunes on 15/02/2022.
//

import Foundation

enum RUError: String, Error {
  
  case urlError = "⛔️ URL Error"
  case taskError = "⛔️ Task Error"
  case responseError = "⛔️ Response Error"
  case dataError = "⛔️ Data Error"
  case decodingError = "⛔️ Decoding error"
}
