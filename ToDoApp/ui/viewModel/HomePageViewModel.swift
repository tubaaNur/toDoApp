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
    func copyDB(){
        let bundlePath = Bundle.main.path(forResource: "toDo", ofType: ".sqlite")
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbUrl = URL(fileURLWithPath: filePath).appendingPathComponent("toDo.sqlite")
        let fm = FileManager.default
        
        if fm.fileExists(atPath: dbUrl.path()){
            print("Veritabanı zaten var")
        }
        else{
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: dbUrl.path)
            }
            catch{
                print(error.localizedDescription
                )
            }
        }
    }
}
