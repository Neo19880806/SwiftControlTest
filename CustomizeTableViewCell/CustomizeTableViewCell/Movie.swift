//
//  Movie.swift
//  CustomizeTableViewCell
//
//  Created by liang on 4/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import Foundation
class Movie{
  var name:String
  var title:String
  var year:Int
  var post:String
  
  init(){
    name = ""
    title = ""
    year = 0
    post = ""
  }
  
  init(name:String,title:String,year:Int,post:String){
    self.name = name
    self.title = title
    self.year = year
    self.post = post
  }
}
