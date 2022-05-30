//
//  RestaurantCollectionViewController.swift
//  MyRestaurant
//
//  Created by 鈴木啓司 on 2022-05-29.
//

import UIKit

class MainCollectionViewController: UICollectionViewController, FilterButtonTappedDelegate {

  enum Section: Hashable{
    case category, foodMenu
  }
  
  var sections = [Section]()
  var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
  var filteredItems: [Item] =  Item.foodMenuItems
  var filteredItemsSnapshot: NSDiffableDataSourceSnapshot<Section, Item> {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections([.category, .foodMenu])
    snapshot.appendItems(Item.categoryItems, toSection: .category)
    snapshot.appendItems(filteredItems, toSection: .foodMenu)
    return snapshot
  }

  var filteringCategories: Set<FoodCategory> = []{
    didSet{
      updateFilteredItem()
    }
  }
  
  func updateFilteredItem(){
    filteredItems = Item.foodMenuItems.filter({ (item) -> Bool in
      guard let menu = item.menu else{
        return false
      }
      
      for filter in filteringCategories{
        if(menu.categories.contains(filter)){
          return true
        }
      }
      return false
    })
    if (filteredItems.isEmpty){
      filteredItems = Item.foodMenuItems
    }
    
    dataSource.apply(filteredItemsSnapshot, animatingDifferences: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .lightGray
    collectionView.collectionViewLayout = createLayout()
    collectionView.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.reuseIdentifier)
    collectionView.register(FoodItemCollectionViewCell.self, forCellWithReuseIdentifier: FoodItemCollectionViewCell.reuseIdentifier)
    configureDataSource()
  }
  
  func configureDataSource() {
    // MARK: Data Source Initialization
    dataSource = .init(collectionView: collectionView, cellProvider: {
      (collectionView, indexPath, item) -> UICollectionViewCell? in
      let section = self.sections[indexPath.section]
      switch section {
      case .category:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! FoodCategoryCollectionViewCell
        cell.configureCell(item.category!.category!)
        cell.delegate = self
        return cell
        
      case .foodMenu:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodItemCollectionViewCell.reuseIdentifier, for: indexPath) as! FoodItemCollectionViewCell
        cell.configureCell(item.menu!)
        return cell
      }
    })
    
    
    // MARK: Snapshot Definition
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
    snapshot.appendSections([.category, .foodMenu])
    snapshot.appendItems(Item.categoryItems, toSection: .category)
    snapshot.appendItems(filteredItems, toSection: .foodMenu)
    
    sections = snapshot.sectionIdentifiers
    dataSource.apply(snapshot)
  }
  
  func createLayout() -> UICollectionViewCompositionalLayout {
    return  UICollectionViewCompositionalLayout{ (sectionIndex, layoutEnvironment) ->
      NSCollectionLayoutSection? in
      let section = self.sections[sectionIndex]
      switch section {
      case .category:
        return self.setupCategoryLayout()
      case .foodMenu:
        let sec = self.setupFoodMenuLayout()
        return sec
      }
    }
  }
  
  
  func setupCategoryLayout() -> NSCollectionLayoutSection{
    // MARK: Promoted Section Layout
    let itemSize =
    NSCollectionLayoutSize(widthDimension:
        .estimated(20), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize =
    NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                           heightDimension: .estimated(44))

    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    
    return section
  }

  
  func setupFoodMenuLayout() -> NSCollectionLayoutSection{
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 8, leading: 5, bottom: 8, trailing: 5)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(166))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .none
    
    return section
  }
  
  func notifyTapped(item: FoodCategoryCollectionViewCell) {
    
    let isSelected = item.filteringButton.isSelected
    let category = item.category!
    
    if(isSelected){
      filteringCategories.insert(category)
    }else{
      filteringCategories.remove(category)
    }
  }
}
