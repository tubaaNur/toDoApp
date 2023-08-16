//
//  RegistrationPage.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class RegistrationPage: UIViewController {
    @IBOutlet weak var tfNote: UITextField!
    
    
    var viewModel = RegistrationPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func buttonSave(_ sender: Any) {
        if let not = tfNote.text{
            save(name: not)
        }
    }
    
    func save(name:String) {
        if let pn = tfNote.text{
            viewModel.save(name: pn)
        }
    }
}
