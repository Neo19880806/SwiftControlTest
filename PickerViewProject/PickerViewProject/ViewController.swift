//
//  ViewController.swift
//  PickerViewProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myPickerView: UIPickerView!
  @IBOutlet weak var myDateView: UIDatePicker!
  
  var movieTitle:[String] = ["ET","Tec","Neo"]
  var movieYear:[Int] = [1978,1999,2008]
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    var count = 0
    if 0 == component {
      count = movieTitle.count
    }else if 1 == component {
      count = movieYear.count
    }
    return count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    var name = ""
    if 0 == component {
      name = movieTitle[row];
    }else if 1 == component {
      name = "\(movieYear[row])";
    }
    return name
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //Keep UIPickerview related with each other
    if 0 == component {
      myPickerView.selectRow(row, inComponent: 1, animated: true)
      //myPickerView.reloadComponent(1)
    }else if 1 == component {
      myPickerView.selectRow(row, inComponent: 0, animated: true)
      //yPickerView.reloadComponent(0)
    }
    //Display what you've selected
    let movie = movieTitle[row]
    let alertController = UIAlertController(title: "Selected Movie", message: movie, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertController.addAction(alertAction)
    self.present(alertController, animated: false, completion: nil)
  }
}

