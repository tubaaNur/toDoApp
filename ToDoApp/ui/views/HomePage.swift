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
        let note = toDo(id: 1, name: "Not defteri")
        
        performSegue(withIdentifier: "toDetail", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let note = sender as? toDo{
                let gidilecekVC = segue.destination as! DetailPage //Downcasting
                gidilecekVC.note = note
            }
            
            
        }
    }
    
}
