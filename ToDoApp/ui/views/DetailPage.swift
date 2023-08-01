//
//  DetailPage.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class DetailPage: UIViewController {
    
    var note:toDo?
    
    @IBOutlet weak var tfNoteDetail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let n = note{
            tfNoteDetail.text = n.name
            
        }

    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let no = tfNoteDetail.text,
           let n = note{
        update(id: n.id!, name: no)
        }
    }
    func update(id:Int, name:String){
        print("Update ToDo: \(id)- \(name)")
        
        
    }
}
