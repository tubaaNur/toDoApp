//
//  ViewController.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet weak var searchBar: UITableView!
    @IBOutlet weak var tableview: UITableView!
    
    var todoList = [toDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        let t1 = toDo(id: 1, name: "Join the community meeting")
        let t2 = toDo(id: 2, name: "iOS Start solving sample cases")
        let t3 = toDo(id: 3, name: "Study your quiz")
        let t4 = toDo(id: 4, name: "Make dinner")
        let t5 = toDo(id: 5, name: "There is a flight to Istanbul on 20 August")
        let t6 = toDo(id: 6, name: "Go to a hairdresser appointment")
        let t7 = toDo(id: 7, name: "Going to the gym in the evening")
        let t8 = toDo(id: 8, name: "Meeting with the girls tomorrow night")
        let t9 = toDo(id: 9, name: "Sleep at 22:00")
        
        todoList.append(t1)
        todoList.append(t2)
        todoList.append(t3)
        todoList.append(t4)
        todoList.append(t5)
        todoList.append(t6)
        todoList.append(t7)
        todoList.append(t8)
        todoList.append(t9)
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

extension HomePage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search ToDo: \(searchText)")

    }
}

extension HomePage : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = todoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellToDo") as! cellToDo
        
        cell.labelToDo.text = toDo.name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = todoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: person)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction,view,bool in
            let toDo = self.todoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Process", message: "\(toDo.name!) delete?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "Okay", style: .destructive){
                action in print("Kişi sil : \(toDo.id!)")
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

    

