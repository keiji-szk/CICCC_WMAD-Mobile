//
//  ViewController.swift
//  TipCalculator
//
//  Created by 鈴木啓司 on 2022-05-20.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var tipAmountLabel: UILabel!
  @IBOutlet var billAmountTextField: UITextField!
  @IBOutlet var tipPercentageTextField: UITextField!
  @IBOutlet var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    registerForKeyboardNotifications()
  }
  
  //Calls this function when the tap is recognized.
  @objc func dismissKeyboard() {
      //Causes the view (or one of its embedded text fields) to resign the first responder status.
      view.endEditing(true)
  }
  
  @IBAction func adjustTipPercentage(_ sender: UISlider) {
    let val = Int(sender.value)
    tipPercentageTextField.text = String(val)
  }
  
  func registerForKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWasShown(_ notification: NSNotification) {
    guard let info = notification.userInfo,
          let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
    
    let keyboardFrame = keyboardFrameValue.cgRectValue
    let keyboardSize = keyboardFrame.size
    
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }
  
  @objc func keyboardWillBeHidden(_ notification: NSNotification) {
    let contentInsets = UIEdgeInsets.zero
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }


  @IBAction func calculateTip(_ sender: UITextField) {
    calculateTip()
  }
  
  @IBAction func changedBillAmount(_ sender: UITextField) {
    calculateTip()
  }
  
  @IBAction func changedTipPercentage(_ sender: UISlider) {
    tipPercentageTextField.text = String(Int(sender.value))
    calculateTip()
  }
  
  private func calculateTip(){
    let tipStr = tipPercentageTextField.text
    let amountBillStr = billAmountTextField.text
    
    guard let tipStr_ = tipStr, let tipFloat = Float(tipStr_) else{
      return
    }
    guard let amountBillStr_ = amountBillStr, let amountFloat = Float(amountBillStr_)else{
      return
    }
        
    let totalAmount = amountFloat * tipFloat * 0.01
    tipAmountLabel.text = String(totalAmount)
  }
  
}

