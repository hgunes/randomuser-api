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
  
  
  convenience init(align: NSTextAlignment, size: CGFloat) {
    self.init(frame: .zero)
    self.textAlignment = align
    self.font = UIFont.boldSystemFont(ofSize: size)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .label
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
  }
}
