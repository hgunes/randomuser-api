//
//  RUMapView.swift
//  RandomUser
//
//  Created by Harun Gunes on 20/02/2022.
//

import UIKit
import MapKit

class RUMapView: MKMapView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    overrideUserInterfaceStyle = .dark
  }
  
}
