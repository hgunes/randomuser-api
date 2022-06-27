//
//  LocationVC.swift
//  RandomUser
//
//  Created by Harun Gunes on 20/02/2022.
//

import UIKit
import MapKit

class LocationVC: UIViewController {
  
  var userViewModel: UserViewModel!
  
  let mapView = RUMapView(frame: .zero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureMapView()
    configureNavigationController()
    addPins()
  }
  
  
  func configureNavigationController() {
    let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
    navigationItem.leftBarButtonItem = doneButton
  }
  
  
  private func configureMapView() {
    view.addSubview(mapView)
    mapView.frame = view.bounds
  }
  
  
  func addPins() {
    let pin = MKPointAnnotation()
//    pin.title = user.name.fullName
    pin.coordinate = CLLocationCoordinate2D(latitude: userViewModel.latitude, longitude: userViewModel.longitude)
    
    mapView.addAnnotation(pin)
  }
  
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
