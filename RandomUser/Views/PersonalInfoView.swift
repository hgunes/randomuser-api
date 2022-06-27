//
//  PersonalInfoView.swift
//  RandomUser
//
//  Created by Harun Gunes on 19/02/2022.
//

import UIKit

class PersonalInfoView: UIView {

  
//  var userViewModel: UserViewModel! {
  
  ///  This property will be taken from UserInfoVC
  ///  and update PersonalInfoView properties' attributes

//    didSet{
//      phoneLabel.text = "Phone"
//      emailLabel.text = "Email address"
//      addressLabel.text = "Address"
//
//      phoneNumber.text = userViewModel.phoneNumber
//      emailAddress.text = userViewModel.emailAddress
//      address.text = userViewModel.address
//    }
//  }
  
  let phoneLabel = RUSecondaryLabel(align: .left, size: 18)
  let phoneNumber = RUMainLabel(align: .left, size: 24)
  
  let emailLabel = RUSecondaryLabel(align: .left, size: 18)
  let emailAddress = RUMainLabel(align: .left, size: 24)
  
  let addressLabel = RUSecondaryLabel(align: .left, size: 18)
  let address = RUMainLabel(align: .left, size: 24)
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(userViewModel: UserViewModel) {
    phoneLabel.text = "Phone"
    emailLabel.text = "Email address"
    addressLabel.text = "Address"
    
    phoneNumber.text = userViewModel.phoneNumber
    emailAddress.text = userViewModel.emailAddress
    address.text = userViewModel.address
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    address.numberOfLines = 0
    
    addSubview(phoneLabel)
    addSubview(phoneNumber)
    addSubview(emailLabel)
    addSubview(emailAddress)
    addSubview(addressLabel)
    addSubview(address)
    
    let padding: CGFloat = 25
    
    NSLayoutConstraint.activate([
      phoneLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      phoneLabel.heightAnchor.constraint(equalToConstant: 22),
      
      phoneNumber.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
      phoneNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      phoneNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      phoneNumber.heightAnchor.constraint(equalToConstant: 30),
      
      emailLabel.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: padding * 2),
      emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      emailLabel.heightAnchor.constraint(equalToConstant: 22),
      
      emailAddress.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
      emailAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      emailAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      emailAddress.heightAnchor.constraint(equalToConstant: 30),
      
      addressLabel.topAnchor.constraint(equalTo: emailAddress.bottomAnchor, constant: padding * 2),
      addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      addressLabel.heightAnchor.constraint(equalToConstant: 22),
      
      address.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
      address.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      address.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      address.heightAnchor.constraint(equalToConstant: 70),
    ])
  }
}
