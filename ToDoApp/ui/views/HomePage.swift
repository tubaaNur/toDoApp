//
//  ViewController.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 1.08.2023.
//

import UIKit

class HomePage: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    
    var todoList = [toDo]()
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        
        _ = viewModel.toDoList.subscribe(onNext: { list in
            self.todoList = list
            self.tableview.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.toDoLoad()
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
        viewModel.search(searchWords: searchText)

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

    

