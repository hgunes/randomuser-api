//
//  UserInfoView.swift
//  RandomUser
//
//  Created by Harun Gunes on 18/02/2022.
//

import UIKit

class UserInfoView: UIView {
  
  let userAvatar = RUAvatarImageView(frame: .zero)
  let username = RUMainLabel(align: .center, size: 32)
  var personalDataLabel = RUMainLabel(align: .center, size: 20)
  
  var user: User!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(user: User) {
    username.text = user.name.fullName
    personalDataLabel.text = "\(user.gender), \(user.nat)"
    
    NetworkManager.shared.fetchUserAvatar(for: user.picture.large) { [weak self] image in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        self.userAvatar.image = image
      }
    }
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(userAvatar)
    addSubview(username)
    addSubview(personalDataLabel)
    
    let avatarEdge: CGFloat = 85
    let padding: CGFloat = 20
    
    NSLayoutConstraint.activate([
      userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
      userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
      userAvatar.heightAnchor.constraint(equalToConstant: avatarEdge),
      userAvatar.widthAnchor.constraint(equalToConstant: avatarEdge),
      
      username.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 20),
      username.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      username.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      username.heightAnchor.constraint(equalToConstant: 24),
      
      personalDataLabel.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 15),
      personalDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      personalDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      personalDataLabel.heightAnchor.constraint(equalToConstant: 20),
    ])
  }
}
