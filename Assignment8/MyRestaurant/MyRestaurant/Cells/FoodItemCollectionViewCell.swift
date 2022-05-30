//
//  FoodItemCollectionViewCell.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import UIKit


class FoodItemCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "FoodItemCollectionViewCell"
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8
    
    return stackView
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    //imageView.image = UIImage(named: "HB")
    
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .label
    label.numberOfLines = 1
    return label
  }()

  let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .label
    label.numberOfLines = 1
    return label
  }()
  
  let subtitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    label.textColor = .label
    return label
  }()
  
  let labelStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 4
    stackView.distribution = .equalSpacing
    return stackView
  }()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    
    stackView.addArrangedSubview(imageView)
    labelStackView.addArrangedSubview(titleLabel)
    labelStackView.addArrangedSubview(priceLabel)
    stackView.addArrangedSubview(labelStackView)
    stackView.addArrangedSubview(subtitleLabel)
    addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(_ foodMenu: FoodMenu) {
    titleLabel.text = foodMenu.title
    priceLabel.text = "$" + String(foodMenu.price)
    
    var strCategory: String = String()
    for cat in foodMenu.categories{
      strCategory += cat.name() + ","
    }
    subtitleLabel.text = strCategory
    imageView.image = UIImage(named: foodMenu.imageName)
  }
  
}
