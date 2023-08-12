//
//  ToDoDaoRepository.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 12.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository{
    var toDoList = BehaviorSubject<[toDo]>(value: [toDo]())
    
    func save(name: String) {
        print("Kişi Kaydet : \(name)")
    }
    func update(id:Int, name:String){
        print("Kişi Güncelle: \(id)- \(name)")
        
        
    }
    
    func delete(id: Int){
        print("Sil: \(id)")
        
    }
    
    func search(searchWords:String){
        print("Search ToDo: \(searchWords)")
        
    }
    
    func toDoLoad(){
        var list = [toDo]()
        let t1 = toDo(id: 1, name: "Join the community meeting")
        let t2 = toDo(id: 2, name: "iOS Start solving sample cases")
        let t3 = toDo(id: 3, name: "Study your quiz")
        let t4 = toDo(id: 4, name: "Make dinner")
        let t5 = toDo(id: 5, name: "There is a flight to Istanbul on 20 August")
        let t6 = toDo(id: 6, name: "Go to a hairdresser appointment")
        let t7 = toDo(id: 7, name: "Going to the gym in the evening")
        let t8 = toDo(id: 8, name: "Meeting with the girls tomorrow night")
        let t9 = toDo(id: 9, name: "Sleep at 22:00")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        list.append(t4)
        list.append(t5)
        list.append(t6)
        list.append(t7)
        list.append(t8)
        list.append(t9)
        toDoList.onNext(list)
    }
    
}
