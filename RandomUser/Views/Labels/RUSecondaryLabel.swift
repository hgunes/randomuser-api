//
//  RUSecondaryLabel.swift
//  RandomUser
//
//  Created by Harun Gunes on 19/02/2022.
//

import UIKit

class RUSecondaryLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  convenience init(align: NSTextAlignment, size: CGFloat) {
    self.init(frame: .zero)
    textAlignment = align
    font = UIFont.boldSystemFont(ofSize: size)
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .secondaryLabel
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
  }
}
