//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var txtName: UITextField!
  @IBOutlet weak var txtTitle: UITextField!
  @IBOutlet weak var txtYear: UITextField!
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func addClick(_ sender: UIButton) {
    if let name = txtName.text,
       let title = txtTitle.text,
      let yearString = txtYear.text{
      if let year = Int(yearString){
        let m = Movie(name: name, title: title, year: year)
        appDelegate.movieArray.append(m)
        
        let alertController = UIAlertController(title: "Info", message: "Add movie success", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
      }
    }else {
      let alertController = UIAlertController(title: "Info", message: "Add movie failed", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(alertAction)
      self.present(alertController, animated: true, completion: nil)
    }
  }
}

