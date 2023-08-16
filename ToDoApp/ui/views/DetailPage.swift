//
//  DetailPage.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class DetailPage: UIViewController {
    
    var note:toDo?
    var viewModel = DetailPageViewModel()
    
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
            viewModel.update(id: n.id!, name: no)
        }
    }
   
}
