//
//  FirstViewController.swift
//  CustomizeTableViewCell
//
//  Created by liang on 4/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  var movieArray = [Movie]()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let m1 = Movie(name: "ET", title: "ET", year: 1978, post: "Dark.jpg")
    let m2 = Movie(name: "Batman", title: "Batman", year: 1980, post: "Pass.jpg")
    let m3 = Movie(name: "Ghost", title: "Ghost", year: 1992, post: "Dark.jpg")
    let m4 = Movie(name: "Storm", title: "Storm", year: 1999, post: "Resident.jpg")
    
    movieArray = [m1,m2,m3,m4]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension FirstViewController:UITableViewDelegate,UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = Bundle.main.loadNibNamed("MyTableViewCell", owner: self, options: nil)?.first as! MyTableViewCell
    let movie = movieArray[indexPath.row]
    cell.lblName.text = movie.name
    cell.lblTitle.text = movie.title
    cell.lblYear.text = "\(movie.year)"
    cell.imgPost.image = UIImage(named: movie.post)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 135
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}
