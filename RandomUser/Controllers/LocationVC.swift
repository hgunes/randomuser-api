//
//  LocationVC.swift
//  RandomUser
//
//  Created by Harun Gunes on 20/02/2022.
//

import UIKit
import MapKit

class LocationVC: UIViewController {
  
  var user: User!
  
  let mapView = MKMapView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    configureNavigationController()
    addPins()
  }
  
  
  func configureNavigationController() {
    let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
    navigationItem.leftBarButtonItem = doneButton
  }
  
  
  private func configure() {
    mapView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(mapView)
    mapView.frame = view.bounds
    mapView.overrideUserInterfaceStyle = .dark
  }
  
  
  func addPins() {
    let pin = MKPointAnnotation()
    pin.title = user.name.fullName
    pin.coordinate = CLLocationCoordinate2D(latitude: Double(user.location.coordinates.latitude)!, longitude: Double(user.location.coordinates.longitude)!)
    
    mapView.addAnnotation(pin)
  }
  
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
