//
//  UserViewModelTests.swift
//  RandomUserTests
//
//  Created by Harun Gunes on 27/06/2022.
//

import XCTest
@testable import RandomUser

class UserViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  
  func testUserViewModel() {
    let user = User(name: Name(first: "John", last: "Doe"), gender: "male", email: "john@doe.com", phone: "123456789", picture: Picture(large: "LARGE PICTURE"), nat: "Something", location: Location(coordinates: Coordinates(latitude: "12.123", longitude: "45.987"), street: Street(name: "Times", number: 1), city: "New York", state: "New York", country: "USA"))
    
    let userViewModel = UserViewModel(user: user)
    
    let fullName = "\(user.name.first) \(user.name.last)"
    let pictureLarge = user.picture.large
    let address = "\(user.location.street.name) \(user.location.street.number), \(user.location.city), \(user.location.state) | \(user.location.country)"
    let latitude = Double(user.location.coordinates.latitude)
    let longitude = Double(user.location.coordinates.longitude)
    
    
    // Assert
    XCTAssertEqual(userViewModel.fullName, fullName)
    XCTAssertEqual(userViewModel.avatarURL, pictureLarge)
    XCTAssertEqual(userViewModel.gender, user.gender)
    XCTAssertEqual(userViewModel.nationality, user.nat)
    XCTAssertEqual(userViewModel.phoneNumber, user.phone)
    XCTAssertEqual(userViewModel.emailAddress, user.email)
    XCTAssertEqual(userViewModel.address, address)
    XCTAssertEqual(userViewModel.latitude, latitude)
    XCTAssertEqual(userViewModel.longitude, longitude)
  }
}
