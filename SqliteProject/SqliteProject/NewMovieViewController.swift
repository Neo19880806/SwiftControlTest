//
//  NewMovieViewController.swift
//  SqliteProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit
import SQLite3
class NewMovieViewController: UIViewController {
  
  @IBOutlet weak var txtName: UITextField!
  @IBOutlet weak var txtTitle: UITextField!
  @IBOutlet weak var txtYear: UITextField!
  
  var db:OpaquePointer?
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func AddClick(_ sender: UIButton) {
    if let name = txtName.text,
      let title = txtTitle.text,
      let yearString = txtYear.text{
      if let year = Int(yearString){
        let m = Movie(id: 0, name: name, title: title, year: year)
        InsertQuery(movie:m)
      }
    }
  }
  
  func InsertQuery(movie:Movie){
    if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK{
      let insertQuery = "insert into movielist(name,title,year) values('\(movie.name)','\(movie.title)',\(movie.year))"
      var queryStatement:OpaquePointer?=nil
      if(sqlite3_prepare_v2(db, insertQuery, -1,&queryStatement,nil) == SQLITE_OK){
        if sqlite3_step(queryStatement) == SQLITE_DONE{
          print("Insert Recored Successfull")
        }else{
          print("Insert Recored failed")
        }
        sqlite3_finalize(queryStatement)
      }else{
        print("Prepare insert query failed")
      }
      sqlite3_close(db)
    }else{
      print("Open database failed")
    }
  }
  
}
