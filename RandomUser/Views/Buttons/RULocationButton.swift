//
//  RULocationButton.swift
//  RandomUser
//
//  Created by Harun Gunes on 20/02/2022.
//

import UIKit

class RULocationButton: UIButton {
 
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    backgroundColor = .systemPink
    layer.cornerRadius = 10
    setTitle("Get location", for: .normal)
  }
}
