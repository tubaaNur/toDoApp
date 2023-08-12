//
//  DetailPageViewModel.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 12.08.2023.
//

import Foundation

class DetailPageViewModel{
    
    var kr = ToDoDaoRepository()
    func update(id:Int, name:String){
        kr.update(id: id, name: name)
        
    }
}
