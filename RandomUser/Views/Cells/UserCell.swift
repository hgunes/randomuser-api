//
//  UserCell.swift
//  RandomUser
//
//  Created by Harun Gunes on 16/02/2022.
//

import UIKit

class UserCell: UICollectionViewCell {
  
  static let reuseID = "UserCell"
  
  let nameLabel = RUMainLabel(align: .left, size: 18)
  let userAvatar = RUAvatarImageView(frame: .zero)
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(userViewModel: UserViewModel) {
    nameLabel.text = userViewModel.fullName
    
    NetworkManager.shared.fetchUserAvatar(for: userViewModel.avatarURL, completed: { image in
      DispatchQueue.main.async {
        self.userAvatar.image = image
      }
    })

  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    backgroundColor = .systemGray6
    layer.cornerRadius = 10
    
    addSubview(nameLabel)
    addSubview(userAvatar)
    
    NSLayoutConstraint.activate([
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
      
      userAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
      userAvatar.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
      userAvatar.heightAnchor.constraint(equalToConstant: 60),
      userAvatar.widthAnchor.constraint(equalToConstant: 60)
    ])
  }
}
