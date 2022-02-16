//
//  HomeViewController.swift
//  RandomUser
//
//  Created by Harun Gunes on 15/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
  
  var users: [User] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    networkCall()
  }
  
  
  func networkCall() {
    NetworkManager.shared.fetchUsers() { [weak self] result in
      
      guard let self = self else { return }
      
      switch result {
      case .success(let users):
        
        self.users = users
        print(self.users)
        
      case .failure(let error):
        print(error.rawValue)
      }
    }
  }
}
