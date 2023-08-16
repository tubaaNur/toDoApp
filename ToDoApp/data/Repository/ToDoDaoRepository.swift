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
    
    let db:FMDatabase?
    
    init(){
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbUrl = URL(fileURLWithPath: filePath).appendingPathComponent("toDo.sqlite")
        db = FMDatabase(path: dbUrl.path)
    }
    
    func save(name: String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO toDo(name) VALUES (?)", values: [name])
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    func update(id:Int, name:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE toDo SET name = ? WHERE id = ?", values: [name,id])
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
    }

    
    
    func delete(id: Int){
        
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM toDo WHERE id = ?", values: [id])
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func search(searchWords:String){
        
        db?.open()
        
        var list = [toDo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDo WHERE name like '%\(searchWords)%'", values: nil)
            
            while result.next(){
                
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
            
                
                let toDo = toDo(id: id, name: name)
                list.append(toDo)
                
            }
            
            toDoList.onNext(list)//Tetikleme
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }

    
    func toDoLoad(){
       
        db?.open()
        
        var liste = [toDo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDo", values: nil)
            
            while result.next(){
                
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
               
                
                let toDo = toDo(id: id, name: name)
                liste.append(toDo)
                
            }
            
            toDoList.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
}

