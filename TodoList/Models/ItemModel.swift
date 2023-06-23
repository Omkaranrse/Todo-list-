//
//  ItemModel.swift
//  TodoList
//
//  Created by Omkar Anarse on 04/06/23.
//

import Foundation

struct ItemModel : Identifiable, Codable{
    let id: String
    let title : String
    let isCompleted : Bool
    
    
    init(id: String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id,title: title, isCompleted: !isCompleted)
    }
}

