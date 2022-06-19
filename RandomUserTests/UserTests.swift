//
//  UserTests.swift
//  RandomUserTests
//
//  Created by Harun Gunes on 19/06/2022.
//

import XCTest
@testable import RandomUser

class UserTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  
  func testCanParse() throws {
    let json = """
    {
    "results": [
    {
    "gender": "male",
    "name": {
    "first": "Gerardo",
    "last": "Mora"
    },
    "location": {
    "street": {
    "number": 7957,
    "name": "Calle de Pedro Bosch"
    },
    "city": "Gandía",
    "state": "Comunidad Valenciana",
    "country": "Spain",
    "coordinates": {
    "latitude": "-23.2250",
    "longitude": "-145.5904"
    }
    },
    "phone": "971-901-537",
    "email": "gerardo.mora@example.com",
    "picture": {
    "large": "https://randomuser.me/api/portraits/men/81.jpg"
    },
    "nat": "ES"
    }
    ]
    }
    """
    
    let data = json.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let result = try decoder.decode(UserResult.self, from: data)
    
    let sampleResult = result.results[0]
    
    XCTAssertNotNil(sampleResult)
    XCTAssertEqual(sampleResult.name.fullName, "Gerardo Mora")
    XCTAssertEqual(sampleResult.gender, "male")
    XCTAssertEqual(sampleResult.email, "gerardo.mora@example.com")
    XCTAssertEqual(sampleResult.phone, "971-901-537")
    XCTAssertEqual(sampleResult.picture.large, "https://randomuser.me/api/portraits/men/81.jpg")
    XCTAssertEqual(sampleResult.nat, "ES")
    XCTAssertEqual(sampleResult.location.country, "Spain")
    XCTAssertEqual(sampleResult.location.state, "Comunidad Valenciana")
    XCTAssertEqual(sampleResult.location.city, "Gandía")
    XCTAssertEqual(sampleResult.location.street.name, "Calle de Pedro Bosch")
    XCTAssertEqual(sampleResult.location.street.number, 7957)
    XCTAssertEqual(sampleResult.location.coordinates.latitude, "-23.2250")
    XCTAssertEqual(sampleResult.location.coordinates.longitude, "-145.5904")
  }
}
