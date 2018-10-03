//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  @IBOutlet weak var myTableView: UITableView!
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  var movieArray:[Movie] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    movieArray = appDelegate.movieArray.sorted{$0.name > $1.name}
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(_ animated: Bool) {
    movieArray = appDelegate.movieArray.sorted{$0.name > $1.name}
    myTableView.reloadData()
  }

}

extension FirstViewController:UITableViewDelegate,UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    let movie = movieArray[indexPath.row]
    myCell.textLabel?.text = movie.name
    myCell.detailTextLabel?.text = "\(movie.year)"
    return myCell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "My favorite movies"
  }
  
}
