//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by 鈴木啓司 on 2022-05-22.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
  
  let minutesToPrepare: Int
  @IBOutlet var confirmationLabel: UILabel!
  
  init?(coder: NSCoder, minutesToPrepare: Int){
    self.minutesToPrepare = minutesToPrepare
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    confirmationLabel.text = "Thank you for your order! Youwait time is approximately \(minutesToPrepare) minutes."
    
    // Do any additional setup after loading the view.
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
