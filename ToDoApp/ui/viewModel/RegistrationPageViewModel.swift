//
//  RegistrationPageViewModel.swift
//  ToDoApp
//
//  Created by Tuba Nur  on 12.08.2023.
//

import Foundation

class RegistrationPageViewModel{
    
    var k = ToDoDaoRepository()
    
    func save(name:String) {
        k.save(name: name)
    }
}
