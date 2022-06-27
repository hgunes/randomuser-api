//
//  HomeViewController.swift
//  RandomUser
//
//  Created by Harun Gunes on 15/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
  
  var userViewModels: [UserViewModel] = []
  var collectionView: UICollectionView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "RandomUser"
    
    networkCall()
    configureCollectionView()
  }
  
  
  func networkCall() {
    NetworkManager.shared.fetchUsers() { [weak self] result in
      
      guard let self = self else { return }
      
      switch result {
      case .success(let users):
        self.userViewModels = users.map({ return UserViewModel(user: $0)})
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
        
      case .failure(let error):
        print(error.rawValue)
      }
    }
  }
  
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout())
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemBackground
    collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseID)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  
  func collectionViewLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: width * 0.9, height: 90)
    layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    return layout
  }
  
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return userViewModels.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.reuseID, for: indexPath) as! UserCell
    let userViewModel = userViewModels[indexPath.row]
//    cell.userViewModel = userViewModel
    cell.set(userViewModel: userViewModel)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let userViewModel = userViewModels[indexPath.row]
    let destinationVC = UserInfoVC(userViewModel: userViewModel)
    let navitagitonController = UINavigationController(rootViewController: destinationVC)
    present(navitagitonController, animated: true)
  }
  
}
