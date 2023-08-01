//
//  ViewController.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonDetail(_ sender: Any) {
        let note = toDo(id: 1, name: "Enter your meeting")
        performSegue(withIdentifier: "toDetail", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let note = sender as? toDo{
                let goToVC = segue.destination as! DetailPage
                goToVC.note = note
            }
            
            
        }
    }
    
}
    

