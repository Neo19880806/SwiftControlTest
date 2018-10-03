//
//  ViewController.swift
//  TableViewProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var myTableView: UITableView!
  
  var movieArray:[Movie] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let m1 = Movie(name: "ET", title: "ET", year: 1978)
    let m2 = Movie(name: "Tec", title: "Tec", year: 1998)
    let m3 = Movie(name: "Neo", title: "Neo", year: 2008)
    
    movieArray = [m1,m2,m3]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    let movie = movieArray[indexPath.row]
    cell.textLabel?.text = movie.title
    cell.detailTextLabel?.text = "\(movie.year)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "My favorite movies"
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      movieArray.remove(at: indexPath.row)
      myTableView.deleteRows(at: [indexPath], with: .fade)
      //myTableView.reloadData()
    }
  }
  
}
