//
//  RUAvatarImageView.swift
//  RandomUser
//
//  Created by Harun Gunes on 17/02/2022.
//

import UIKit

class RUAvatarImageView: UIImageView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 10
    clipsToBounds = true
  }
}
