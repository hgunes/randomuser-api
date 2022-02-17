//
//  RUMainLabel.swift
//  RandomUser
//
//  Created by Harun Gunes on 17/02/2022.
//

import UIKit

class RUMainLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    font = UIFont.boldSystemFont(ofSize: 18)
    textColor = .black
  }
}
