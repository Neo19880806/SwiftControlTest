//
//  Movie.swift
//  TableViewProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import Foundation
class Movie{
  var name:String
  var title:String
  var year:Int
  
  init(){
    name = ""
    title = ""
    year = 0
  }
  
  init(name:String,title:String,year:Int){
    self.name = name
    self.title = title
    self.year = year
  }
}
