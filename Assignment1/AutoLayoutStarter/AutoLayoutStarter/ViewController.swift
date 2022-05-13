//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  static let controlMergin: CGFloat = 20
  static let controlHeight: CGFloat = 50

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let purpleView: UIView = {
    let thisView = UIView()
    thisView.translatesAutoresizingMaskIntoConstraints = false
    thisView.backgroundColor = .purple
    thisView.frame = CGRect.zero
    return thisView
  }()
  
  let blueViews: [UIView] = {
   var ret = [UIView]()
    for i in 1...3{
      let blueView = UIView()
      blueView.translatesAutoresizingMaskIntoConstraints = false
      blueView.backgroundColor = .blue
      blueView.heightAnchor.constraint(equalToConstant: ViewController.controlHeight).isActive = true
      blueView.widthAnchor.constraint(equalToConstant: ViewController.controlHeight).isActive = true
      ret.append(blueView)
    }
    
    for i in 1...2{
      let pseudoView = UIView()
      pseudoView.translatesAutoresizingMaskIntoConstraints = false
      if i == 1{
        ret.insert(pseudoView, at: 0)
      }else{
        ret.append(pseudoView)
      }
    }
    return ret
  }()
  
  let redView: UIStackView = {
    let thisView = UIStackView()
    thisView.translatesAutoresizingMaskIntoConstraints = false
    thisView.backgroundColor = .red
    thisView.frame = CGRect.zero
    return thisView
  }()
  
  let orangeView: [UIStackView] = {
    var thisView = [UIStackView]()
    for _ in 1...2{
      let orangeView = UIStackView()
      orangeView.translatesAutoresizingMaskIntoConstraints = false
      orangeView.backgroundColor = .orange
      orangeView.frame = CGRect.zero
      thisView.append(orangeView)
    }
    return thisView
  }()

  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }
  
  fileprivate func setupOrange(){
    let orangeView1 = orangeView[0]
    redView.addSubview(orangeView1)
    orangeView1.translatesAutoresizingMaskIntoConstraints = false
    orangeView1.backgroundColor = .orange
    orangeView1.frame = CGRect.zero
    orangeView1.leftAnchor.constraint(equalTo: redView.leftAnchor, constant: 10).isActive = true
    orangeView1.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
    orangeView1.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
    orangeView1.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true

    let orangeView2 = orangeView[1]
    redView.addSubview(orangeView2)
    orangeView2.translatesAutoresizingMaskIntoConstraints = false
    orangeView2.backgroundColor = .orange
    orangeView2.frame = CGRect.zero
    orangeView2.leftAnchor.constraint(equalTo: orangeView1.rightAnchor, constant: 10).isActive = true
    orangeView2.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
    orangeView2.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
    orangeView2.rightAnchor.constraint(equalTo: redView.rightAnchor, constant: -10).isActive = true
  }
  
  fileprivate func setupRed(){
    mainView.addSubview(redView)
    redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: ViewController.controlMergin).isActive = true
    redView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -ViewController.controlMergin).isActive = true
    redView.heightAnchor.constraint(equalToConstant: ViewController.controlHeight).isActive = true
    redView.widthAnchor.constraint(equalToConstant: ViewController.controlHeight * 4).isActive = true
    redView.axis = .horizontal
    redView.alignment = .center
    redView.distribution = .fillEqually
    redView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    setupOrange()
  }
  
  fileprivate func setupPurple(){
    mainView.addSubview(purpleView)
    purpleView.leftAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -75).isActive = true
    purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -ViewController.controlMergin).isActive = true
    purpleView.heightAnchor.constraint(equalToConstant: ViewController.controlHeight).isActive = true
    purpleView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -ViewController.controlMergin).isActive = true
  }
  
  fileprivate func setupBlue(){
    let blueStackView = UIStackView(arrangedSubviews: blueViews)
    blueStackView.translatesAutoresizingMaskIntoConstraints = false
    blueStackView.axis = .vertical
    blueStackView.alignment = .center
    blueStackView.distribution = .equalSpacing
    mainView.addSubview(blueStackView)

    blueStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    blueStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    blueStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    blueStackView.widthAnchor.constraint(equalToConstant: ViewController.controlHeight).isActive = true
  }
  

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true

    // setting purpleView anchor
    setupPurple()
    
    // setting blueView anchor
    setupBlue()
    
    // setting orangeView anchor
    setupRed()

    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually

    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

