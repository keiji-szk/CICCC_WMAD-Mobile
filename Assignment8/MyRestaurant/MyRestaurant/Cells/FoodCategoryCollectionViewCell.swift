//
//  FoodCategoryCollectionViewCell.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import UIKit

protocol FilterButtonTappedDelegate{
  func notifyTapped(item: FoodCategoryCollectionViewCell)
}


class FoodCategoryCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "CategoryCollectionViewCell"
  
  var category: FoodCategory?
  var delegate: FilterButtonTappedDelegate?
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    //stackView.spacing = 3
    stackView.distribution = .fillProportionally
    stackView.alignment = .leading
    return stackView
  }()
  
  let filteringButton: UIButton = {
    var button = UIButton()
    button.backgroundColor = UIColor.darkGray
    button.layer.cornerRadius = 12
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setContentHuggingPriority(.required, for: .horizontal)
    //button.setTitle("test_uuu", for: .normal)
    return button
  }()
  
  @objc func toggleFilter(sender: UIButton!){
    sender.isSelected.toggle()
    if sender.isSelected{
      sender.backgroundColor = .green
    }else{
      sender.backgroundColor = .darkGray
    }
    
    if let del = delegate{
      del.notifyTapped(item: self)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    filteringButton.addTarget(nil, action: #selector(toggleFilter(sender:)), for: .touchUpInside)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(filteringButton)
    
    addSubview(stackView)
    //addSubview(lineView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(_ category: FoodCategory) {
    self.category = category
    filteringButton.setTitle(category.name(), for: .normal)
  }
}
