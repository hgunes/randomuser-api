//
//  UserCell.swift
//  RandomUser
//
//  Created by Harun Gunes on 16/02/2022.
//

import UIKit

class UserCell: UICollectionViewCell {
  
  static let reuseID = "UserCell"
  
  let nameLabel = UILabel()
  let userAvatar = UIImageView()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(name: String, avatarUrl: String) {
    nameLabel.text = name
    
    NetworkManager.shared.fetchUserAvatar(for: avatarUrl) { [weak self] image in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        self.userAvatar.image = image
      }
    }
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    backgroundColor = .systemGray6
    layer.cornerRadius = 10
    
    addSubview(nameLabel)
    addSubview(userAvatar)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    userAvatar.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
      
      userAvatar.centerYAnchor.constraint(equalTo: centerYAnchor),
      userAvatar.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
      userAvatar.heightAnchor.constraint(equalToConstant: 50),
      userAvatar.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
}
