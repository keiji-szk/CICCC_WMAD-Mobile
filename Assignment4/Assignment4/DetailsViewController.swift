//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by 鈴木啓司 on 2022-05-04.
//  Copyright © 2022 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
  
  var city: City!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
//    let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 50))
//    cityLabel.text = "Country"
//    cityLabel.textAlignment = .center
//    cityLabel.font = UIFont(name: "Helvetica Neue", size: 50)
    
    let labels: [UILabel] = (0 ..< 8).map({ _ -> UILabel in
      let ret = UILabel()
      ret.textAlignment = .center
      ret.font = UIFont(name: "Helvetica Neue", size: 15)
      return ret})
    labels[0].text = "Country"
    labels[1].text = city.nationalFlag
    labels[2].text = "City"
    labels[3].text = city.name
    labels[4].text = "temperature"
    labels[5].text = String(city.temp)
    labels[6].text = "Summary"
    labels[7].text = city.summary
  
    let stackView = UIStackView(arrangedSubviews: labels)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
    view.addSubview(stackView)

    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
