//
//  ViewController.swift
//  SqliteProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit
import SQLite3


class DisplayViewController: UIViewController {

  @IBOutlet weak var myTableView: UITableView!
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    appDelegate.movieArray.removeAll()
    selectQuery()
    myTableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func selectQuery(){
    var db:OpaquePointer? = nil
    if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK{
      let selectQueryStatement = "select * from movielist"
      var queryStatement:OpaquePointer? = nil
      if (sqlite3_prepare_v2(db, selectQueryStatement, -1, &queryStatement, nil) == SQLITE_OK) {
        print("Query Result")
        while (sqlite3_step(queryStatement) == SQLITE_ROW){
          let id = Int(sqlite3_column_int(queryStatement, 0))
          let name = String(cString: sqlite3_column_text(queryStatement, 1)!)
          let title = String(cString: sqlite3_column_text(queryStatement, 2)!)
          let year = Int(sqlite3_column_int(queryStatement, 3))
          let movie = Movie(id:id,name: name, title: title, year: year)
          appDelegate.movieArray.append(movie)
        }
      }else{
        print("statement couldn't be prepared")
      }
      sqlite3_finalize(queryStatement)
    }else{
      print("Open database failed")
    }
    sqlite3_close(db)
  }
  
  func deleteQuery(_ movie:Movie){
    var db:OpaquePointer? = nil
    if sqlite3_open(appDelegate.getDBPath(), &db) == SQLITE_OK{
      let deleteQuery = "delete from movielist where id = \(movie.id)"
      var queryStatement:OpaquePointer? = nil
      if sqlite3_prepare_v2(db, deleteQuery, -1, &queryStatement, nil) == SQLITE_OK{
        if sqlite3_step(queryStatement) == SQLITE_DONE{
          print("Delete movie successfully")
        }else{
          print("Delete movie failed")
        }
        sqlite3_finalize(queryStatement)
      }else{
        print("Prepare delete failed")
      }
    }else{
      print("Open database failed")
    }
    sqlite3_close(db)
  }
}

extension DisplayViewController:UITableViewDelegate,UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return appDelegate.movieArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    let movie = appDelegate.movieArray[indexPath.row]
    cell.textLabel?.text = movie.title
    cell.detailTextLabel?.text = "\(movie.year)"
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "My favorite movie"
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete{
      let movie = appDelegate.movieArray[indexPath.row]
      deleteQuery(movie)
      appDelegate.movieArray.remove(at:indexPath.row)
      myTableView.reloadData()
    }
  }
}

