//
//  toDo.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import Foundation

class toDo{
   
    
    var id:Int?
    var name:String?
    
    init(){
        
    }
    
    internal init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

