//
//  LocationVC.swift
//  RandomUser
//
//  Created by Harun Gunes on 20/02/2022.
//

import UIKit

class LocationVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .green
    configureNavigationController()
  }
  
  
  func configureNavigationController() {
    let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
    navigationItem.leftBarButtonItem = doneButton
  }
  
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
