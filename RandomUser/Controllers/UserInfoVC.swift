//
//  UserInfoVC.swift
//  RandomUser
//
//  Created by Harun Gunes on 18/02/2022.
//

import UIKit

class UserInfoVC: UIViewController {
  
  var user: User!
  
  let mainInfoView = UserInfoView(frame: .zero)
  let personalInfoView = PersonalInfoView(frame: .zero)
  let getLocationButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(user: User) {
    super.init(nibName: nil, bundle: nil)
    self.user = user
  }
  
  
  private func configure() {
    view.backgroundColor = .systemBackground
    
    view.addSubview(mainInfoView)
    view.addSubview(personalInfoView)
    view.addSubview(getLocationButton)
    
    mainInfoView.set(user: user)
    personalInfoView.set(user: user)
    
    mainInfoView.translatesAutoresizingMaskIntoConstraints = false
    personalInfoView.translatesAutoresizingMaskIntoConstraints = false
    getLocationButton.translatesAutoresizingMaskIntoConstraints = false
    
    getLocationButton.backgroundColor = .blue
    getLocationButton.layer.cornerRadius = 10
    getLocationButton.setTitle("Get location", for: .normal)
    
    getLocationButton.addTarget(self, action: #selector(getLocationButtonClicked), for: .touchUpInside)
    
    let padding: CGFloat = 20
    
    NSLayoutConstraint.activate([
      mainInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding * 3),
      mainInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      mainInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      mainInfoView.heightAnchor.constraint(equalToConstant: 220),
      
      personalInfoView.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: padding * 2),
      personalInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      personalInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      personalInfoView.heightAnchor.constraint(equalToConstant: 340),
      
      getLocationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding * 2),
      getLocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      getLocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      getLocationButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  
  @objc
  func getLocationButtonClicked() {
    print("Fav button clicked")
  }
}
