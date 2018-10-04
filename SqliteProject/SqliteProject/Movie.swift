//
//  Movie.swift
//  SqliteProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import Foundation
class Movie{
  var id:Int
  var name:String
  var title:String
  var year:Int
  
  init(){
    id = 0
    name = ""
    title = ""
    year = 0
  }
  
  init(id:Int,name:String,title:String,year:Int){
    self.id = id
    self.name = name
    self.title = title
    self.year = year
  }
}
