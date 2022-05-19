//
//  ViewController.swift
//  NavigationAnimation
//
//  Created by 鈴木啓司 on 2022-05-19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

  
  
  var isShow = false
  var viewStack : UIStackView!
  var titleLabel : UILabel!
  @IBOutlet var navBarView: UIView!
  @IBOutlet var navBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet var addButton: UIButton!
  @IBOutlet var tableView: UITableView!
  private var selectedItem = [String]()
  private let items = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTitlelayout()
    setImageLayout()
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func setTitlelayout(){
    titleLabel = UILabel(frame: CGRect())
    navBarView.addSubview(titleLabel)
    titleLabel.text = "SNACS"
    titleLabel.textAlignment = .center
    titleLabel.font = titleLabel.font.withSize(24)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
    titleLabel.widthAnchor.constraint(equalTo: navBarView.widthAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 20).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  func setImageLayout(){
    viewStack = UIStackView(frame: CGRect(x: 0, y: 88, width: view.frame.width, height: 100))
    navBarView.addSubview(viewStack)
    let imageView1 = UIImageView(image: UIImage(named: "oreos"))
    let imageView2 = UIImageView(image: UIImage(named: "pizza_pockets"))
    let imageView3 = UIImageView(image: UIImage(named: "pop_tarts"))
    let imageView4 = UIImageView(image: UIImage(named: "popsicle"))
    let imageView5 = UIImageView(image: UIImage(named: "ramen"))
    let imageViews = [imageView1, imageView2, imageView3, imageView4, imageView5]
    var imgNum = 0
    imageViews.forEach{
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addItem(_:)))
      $0.isUserInteractionEnabled = true
      $0.addGestureRecognizer(tapGestureRecognizer)
      $0.tag = imgNum
      imgNum += 1
      viewStack.addArrangedSubview($0)
    }
    viewStack.isHidden = true
    viewStack.axis = .horizontal
    viewStack.distribution = .fillEqually
    
    viewStack.translatesAutoresizingMaskIntoConstraints = false
    viewStack.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
    viewStack.leftAnchor.constraint(equalTo: navBarView.leftAnchor).isActive = true
    viewStack.rightAnchor.constraint(equalTo: navBarView.rightAnchor).isActive = true
    viewStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  @objc private func addItem(_ sender: UITapGestureRecognizer) {
    if !isShow{
      return
    }
    
    if let i = sender.view?.tag {
      selectedItem.append(items[i])
      let indexPath = IndexPath(row: selectedItem.count - 1, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    }
  }
  
  
  @objc func plusButtonTapped(_ sender: UIButton) {
    isShow.toggle()
    
    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: { [self] in
      self.navBarHeightConstraint.constant = isShow ? 200 : 88
      let rotateAngle = isShow ? CGFloat.pi / 2 : -CGFloat.pi / 2
      addButton.transform = CGAffineTransform(rotationAngle: rotateAngle)
      self.view.layoutIfNeeded()
    })
    
    viewStack.isHidden = !isShow
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = selectedItem[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedItem.count
  }
    
}
