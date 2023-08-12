//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 12.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel{
    
    var krepo = ToDoDaoRepository()
    var toDoList = BehaviorSubject<[toDo]>(value: [toDo]())
    
    init(){
        toDoList = krepo.toDoList
    }
    
    func delete(id: Int){
        krepo.delete(id: id)
        toDoLoad()
    }
    
    func search(searchWords:String){
        krepo.search(searchWords: searchWords)
        
    }
    
    func toDoLoad(){
        
        krepo.toDoLoad()
    }
}
