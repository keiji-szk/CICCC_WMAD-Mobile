//
//  ViewController.swift
//  Mad Scientists House
//
//  Created by 鈴木啓司 on 2022-05-02.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let barButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(fastForward(_:)))
    
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  @objc func fastForward(_ sender: UIBarButtonItem){
    navigationController?.popToRootViewController(animated: false)
  }


}

